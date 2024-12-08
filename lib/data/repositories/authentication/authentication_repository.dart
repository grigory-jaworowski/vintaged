
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vintaged/features/authentication/screens/login/login.dart';
import 'package:vintaged/home_menu.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final deviceStorage = GetStorage();

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  screenRedirect() async {
    deviceStorage.writeIfNull('IsFirstTime', true);

    deviceStorage.read('IsFirstTime') != true ? Get.offAll(() => const HomeMenu()) : Get.offAll(const LoginScreen());
  }
}