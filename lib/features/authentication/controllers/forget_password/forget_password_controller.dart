import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vintaged/data/repositories/authentication/authentication_repository.dart';
import 'package:vintaged/features/authentication/screens/password_config/reset_password.dart';
import 'package:vintaged/utils/constants/image_strings.dart';
import 'package:vintaged/utils/helpers/network_manager.dart';
import 'package:vintaged/utils/popups/full_screen_loader.dart';
import 'package:vintaged/utils/popups/loaders.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  sendPasswordResetEmail() async {
    try{
      // Start loading
      VFullScreenLoader.openLoadingDialog('Signing-in', VImages.docerAnimation);

      // Check internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        VFullScreenLoader.stopLoading();
        return;
      }

      // Form validation
      if (!forgetPasswordFormKey.currentState!.validate()) {
        VFullScreenLoader.stopLoading();
        return;
      }

      // Send email to reset password
      await AuthenticationRepository.instance.sendPasswordResetEmail(email.text.trim());

      // Remove Loader
      VFullScreenLoader.stopLoading();

      // Show success screen
      VLoaders.successSnackBar(title: 'Email sent', message: 'Reset password link successfully sent to your email'.tr);

      // Redirect
      Get.to(() => ResetPasswordScreen(email: email.text.trim()));

    } catch (e){
      VFullScreenLoader.stopLoading();
      VLoaders.errorSnackBar(title: 'Unexpected error!', message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async {
    try{
      // Start loading
      VFullScreenLoader.openLoadingDialog('Signing-in', VImages.docerAnimation);

      // Check internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        VFullScreenLoader.stopLoading();
        return;
      }

      // Send email to reset password
      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      // Show success screen
      VLoaders.successSnackBar(title: 'Email sent', message: 'Reset password link successfully sent to your email'.tr);

    } catch (e){
      VFullScreenLoader.stopLoading();
      VLoaders.errorSnackBar(title: 'Unexpected error!', message: e.toString());
    }
  }
}