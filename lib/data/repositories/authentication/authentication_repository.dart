import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vintaged/features/authentication/screens/login/login.dart';
import 'package:vintaged/home_menu.dart';
import 'package:vintaged/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:vintaged/utils/exceptions/firebase_exceptions.dart';
import 'package:vintaged/utils/exceptions/format_exceptions.dart';
import 'package:vintaged/utils/exceptions/platform_exceptions.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  screenRedirect() async {
    deviceStorage.writeIfNull('IsFirstTime', true);
    deviceStorage.read('IsFirstTime') != true ? Get.offAll(() => const HomeMenu()) : Get.offAll(const LoginScreen());
  }

  Future<UserCredential> singleFactorAuthentication(String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(email: email, password: password);
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