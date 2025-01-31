import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../features/shop/models/product_model.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Fetch products sorted by "Likes" in descending order
  Future<List<ProductModel>> getPopularProducts() async {
    try {
      final snapshot = await _db
          .collection('Products')
          .orderBy('Likes', descending: true)
          .limit(10)
          .get();
      final list = snapshot.docs
          .map((document) => ProductModel.fromSnapshot(document))
          .toList();
      return list;
    } on FirebaseException catch (e) {
      throw VFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const VFormatException();
    } on PlatformException catch (e) {
      throw VPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  Future<List<ProductModel>> fetchProductsByQuery(Query query) async {
    try {
      final querySnapshot = await query.get();
      final List<ProductModel> productList = querySnapshot.docs.map((doc) => ProductModel.fromQuerySnapshot(doc)).toList();
      return productList;
    } on FirebaseException catch (e) {
      throw VFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw VPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  Future<List<ProductModel>> getProductsForCategory({required String subCategoryId}) async {
    try {
      final snapshot = await _db.collection('Products').where('SubCategoryId', isEqualTo: subCategoryId).get();
      final list = snapshot.docs.map((document) => ProductModel.fromSnapshot(document)).toList();
      return list;
    } on FirebaseException catch (e) {
      throw VFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const VFormatException();
    } on PlatformException catch (e) {
      throw VPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
}
