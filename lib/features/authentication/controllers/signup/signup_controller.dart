import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vintaged/utils/helpers/network_manager.dart';
import 'package:vintaged/utils/popups/full_screen_loader.dart';
import 'package:vintaged/utils/popups/loaders.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  final hidePassword = true.obs;
  final privacyPolicy = true.obs;
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final username = TextEditingController();
  final email = TextEditingController();
  final phoneNumber = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  Future<void> signup() async {
    try {
      // Start loading
      VFullScreenLoader.openLoadingDialog('Processing data...', 'animation');

      //Check internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) return;

      // Form validation
      if (!signupFormKey.currentState!.validate()) return;

      // Privacy Policy check
      if (!privacyPolicy.value) {
        VLoaders.warningSnackBar(
          title: 'Accept Privacy Policy',
          message: 'In order to create account, you must read and accept the Privacy Policy & Terms of Use',
        );
        return;
      }
    } catch (e) {
      VLoaders.errorSnackBar(title: 'Unexpected error', message: e.toString());
    } finally {
      VFullScreenLoader.stopLoading();
    }
  }
}