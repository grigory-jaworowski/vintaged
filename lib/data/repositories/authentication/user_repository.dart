import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:vintaged/features/authentication/models/user_model.dart';
import 'package:vintaged/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:vintaged/utils/exceptions/firebase_exceptions.dart';
import 'package:vintaged/utils/exceptions/format_exceptions.dart';
import 'package:vintaged/utils/exceptions/platform_exceptions.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Function to save user data to Fire
  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection("Users").doc(user.id).set(user.toJson());
    } on FirebaseAuthException catch (e) {
      throw VFirebaseAuthException(e.code).message;
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