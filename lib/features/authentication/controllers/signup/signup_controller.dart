import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vintaged/data/repositories/authentication/authentication_repository.dart';
import 'package:vintaged/data/repositories/user/user_repository.dart';
import 'package:vintaged/features/authentication/models/user_model.dart';
import 'package:vintaged/features/authentication/screens/signup/verify_email.dart';
import 'package:vintaged/utils/constants/image_strings.dart';
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

  void signup() async {
    try {
      // Start loading
      VFullScreenLoader.openLoadingDialog('Processing data...', VImages.docerAnimation);

      //Check internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        VFullScreenLoader.stopLoading();
        return;
      }

      // Form validation
      if (!signupFormKey.currentState!.validate()) {
        VFullScreenLoader.stopLoading();
        return;
      }

      // Privacy Policy check
      if (!privacyPolicy.value) {
        VLoaders.warningSnackBar(
          title: 'Accept Privacy Policy',
          message: 'In order to create account, you must read and accept the Privacy Policy & Terms of Use',
        );
        VFullScreenLoader.stopLoading();
        return;
      }

      // Register user in the Firebase Authenticator & Save user data in the Firebase
      final userCredentials = await AuthenticationRepository.instance.singleFactorAuthentication(email.text.trim(), password.text.trim());
      
      // Save authenticated user data in the Firebase Firestore
      final newUser = UserModel(
        id: userCredentials.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        username: username.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      // Remove Loader
      VFullScreenLoader.stopLoading();

      // Successful authentication message
      VLoaders.successSnackBar(title: 'Congratulations', message: 'Your account has been created! Please verify your email to continue.');

      // Move to Verify Email Screen
      Get.to(() => VerifyEmailScreen(email: email.text.trim()));
    } catch (e) {
      VFullScreenLoader.stopLoading();

      VLoaders.errorSnackBar(title: 'Unexpected error', message: e.toString());
    }
  }
}