import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vintaged/data/repositories/authentication/authentication_repository.dart';
import 'package:vintaged/utils/constants/image_strings.dart';
import 'package:vintaged/utils/helpers/network_manager.dart';
import 'package:vintaged/utils/popups/full_screen_loader.dart';
import 'package:vintaged/utils/popups/loaders.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final deviceStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  Future<void> emailAndPasswordSignIn() async {
    try {
      // Start loading
    VFullScreenLoader.openLoadingDialog('Signing-in', VImages.docerAnimation);

    // Check internet connection
    final isConnected = await NetworkManager.instance.isConnected();
    if (!isConnected) {
      VFullScreenLoader.stopLoading();
      return;
    }

    // Form validation
    if (!loginFormKey.currentState!.validate()) {
      VFullScreenLoader.stopLoading();
      return;
    }

    // Save data if Remember Me is selected
    if (rememberMe.value) {
      deviceStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
      deviceStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
    }

    // Login user with email and password
    final UserCredentials = await AuthenticationRepository.instance.loginWithEmailAndPassword(email.text.trim(), password.text.trim());

    // Remove Loader
    VFullScreenLoader.stopLoading();

    // Redirect
    AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      VFullScreenLoader.stopLoading();
      VLoaders.errorSnackBar(title: 'Unexpected error!', message: e.toString());
    }
  }
}