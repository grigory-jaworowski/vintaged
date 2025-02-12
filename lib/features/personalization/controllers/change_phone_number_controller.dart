import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/repositories/user/user_repository.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/helpers/network_manager.dart';
import '../../../utils/popups/full_screen_loader.dart';
import '../../../utils/popups/loaders.dart';
import '../screens/profile.dart';
import 'user_controller.dart';

class UpdatePhoneController extends GetxController{
  static UpdatePhoneController get instance => Get.find();

  final phoneNumber = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updatePhoneController = GlobalKey<FormState>();

  @override
  void onInit() {
    initializePhone();
    super.onInit();
  }

  Future<void> initializePhone() async {
    phoneNumber.text = userController.user.value.phoneNumber;
  }

  Future<void> updatePhone() async {
    try {
      // Start loading
      VFullScreenLoader.openLoadingDialog('Loading information...', VImages.docerAnimation);

      // Check internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        VFullScreenLoader.stopLoading();
        return;
      }

      // Form validation
      if (!updatePhoneController.currentState!.validate()) {
        VFullScreenLoader.stopLoading();
        return;
      }

      // Update user first and lastname in the Firebase Firestore
      Map<String, dynamic> name = {'PhoneNumber': phoneNumber.text.trim()};
      await userRepository.updateSingleField(name);

      // Update Rx user value
      userController.user.value.phoneNumber = phoneNumber.text.trim();

      // Remove loader
      VFullScreenLoader.stopLoading();

      // Show success message
      VLoaders.successSnackBar(title: 'Congratulations!', message: 'Your phone number has been updated successfully!');

      // Move to previous screen
      Get.off(() => const ProfileScreen());
    } catch (e) {
      VFullScreenLoader.stopLoading();
      VLoaders.errorSnackBar(title: 'Unexpected error!', message: e.toString());
    }
  }
}