import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../features/market/models/banner_model.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class BannerRepository extends GetxController {
  static BannerRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<BannerModel>> getAllBanners() async {
    try {
      final snapshot = await _db.collection('Banners').where('Active', isEqualTo: true).get();
      final list = snapshot.docs.map((document) => BannerModel.fromSnapshot(document)).toList();
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
