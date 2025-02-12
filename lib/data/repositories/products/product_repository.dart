import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vintaged/data/repositories/authentication/authentication_repository.dart';

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
          .where('isFeatured', isEqualTo: true)
          .limit(4)
          .get();
      final list = snapshot.docs
        .map((document) => ProductModel.fromSnapshot(document))
        .where((product) => product.owner != AuthenticationRepository.instance.authUser?.uid) // Filter locally
        .take(4) // Ensure only 4 are displayed
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

  // Function to update product data in Firestore
  Future<void> updateProduct(ProductModel updatedProduct) async {
    try {
      await _db
          .collection("Products")
          .doc(updatedProduct.id)
          .update(updatedProduct.toJson());
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

  Future<void> deleteProduct(String productId) async {
    try {
      await _db.collection("Products").doc(productId).delete();
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

  Future<List<ProductModel>> getUserProducts() async {
    try {
      final snapshot = await _db
          .collection('Products')
          .where('Owner',
              isEqualTo: AuthenticationRepository.instance.authUser?.uid)
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

  /// Get favorite products based on a list of product IDs.
  Future<List<ProductModel>> getFavouriteProducts(
      List<String> productIds) async {
    try {
      final snapshot = await _db
          .collection('Products')
          .where(FieldPath.documentId, whereIn: productIds)
          .get();
      return snapshot.docs
          .map((querySnapshot) => ProductModel.fromSnapshot(querySnapshot))
          .toList();
    } on FirebaseException catch (e) {
      throw VFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw VPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  Future<List<ProductModel>> fetchProductsByQuery(Query query) async {
    try {
      final querySnapshot = await query.get();
      final List<ProductModel> productList = querySnapshot.docs
          .map((doc) => ProductModel.fromQuerySnapshot(doc))
          .toList();
      return productList;
    } on FirebaseException catch (e) {
      throw VFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw VPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  Future<List<ProductModel>> getProductsByCategory({
    required String categoryId,
    required String field, // Pass either "CategoryId" or "SubCategoryId"
  }) async {
    try {
      final snapshot = await _db
          .collection('Products')
          .where(field, isEqualTo: categoryId)
          .get();

      return snapshot.docs
        .map((document) => ProductModel.fromSnapshot(document))
        .where((product) => product.owner != AuthenticationRepository.instance.authUser?.uid) // Filter locally
        .toList();
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

  // Create product
  Future<String> createProduct(ProductModel product) async {
    try {
      final result = await _db.collection('Products').add(product.toJson());
      return result.id;
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

  Future<void> deleteProductImage(String productId, String imageUrl) async {
    try {
      await _db.collection('Products').doc(productId).update({
        'Images': FieldValue.arrayRemove([imageUrl]),
      });
    } on FirebaseException catch (e) {
      throw VFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const VFormatException();
    } on PlatformException catch (e) {
      throw VPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong while deleting the image. Please try again';
    }
  }

  Future<void> deleteImageFromStorage(String imageUrl) async {
    try {
      // Extract image path from the URL
      Uri uri = Uri.parse(imageUrl);
      String imagePath =
          Uri.decodeComponent(uri.pathSegments.last.split('?').first);

      // Ensure path is correct
      if (!imagePath.startsWith('Shop/Images/')) {
        throw 'Invalid image path: $imagePath';
      }

      // Delete from Firebase Storage
      await FirebaseStorage.instance.ref(imagePath).delete();
    } on FirebaseException catch (e) {
      throw VFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const VFormatException();
    } on PlatformException catch (e) {
      throw VPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong while deleting the image from Storage. Please try again';
    }
  }

  // Upload multiple images concurrently
  Future<List<String>> uploadMultipleImages(
      String path, List<XFile> images) async {
    try {
      List<Future<String>> uploadTasks = images.map((image) async {
        final ref = FirebaseStorage.instance.ref(path).child(image.name);
        await ref.putFile(File(image.path));
        return await ref.getDownloadURL();
      }).toList();

      return await Future.wait(uploadTasks);
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

  Future<List<ProductModel>> searchProducts(String query) async {
    try {
      // Reference to the 'products' collection in Firestore
      CollectionReference productsCollection = FirebaseFirestore.instance.collection('Products');

      // Start with a basic query to search for products where the name contains the query
      Query queryRef = productsCollection;

      // Apply the search filter
      if (query.isNotEmpty) {
        queryRef = queryRef.where('Title', isGreaterThanOrEqualTo: query).where('Title', isLessThanOrEqualTo: '$query\uf8ff');
      }

      // Execute the query
      QuerySnapshot querySnapshot = await queryRef.get();

      // Map the documents to ProductModel objects
      final products = querySnapshot.docs.map((doc) => ProductModel.fromQuerySnapshot(doc)).toList();

      return products;
    } on FirebaseException catch (e) {
      throw VFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw VPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
}
