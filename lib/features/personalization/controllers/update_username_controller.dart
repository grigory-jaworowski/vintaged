import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/repositories/user/user_repository.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/helpers/network_manager.dart';
import '../../../utils/popups/full_screen_loader.dart';
import '../../../utils/popups/loaders.dart';
import 'user_controller.dart';

class UpdateUsernameController extends GetxController{
  static UpdateUsernameController get instance => Get.find();

  final username = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUsernameController = GlobalKey<FormState>();

  @override
  void onInit() {
    initializeUsername();
    super.onInit();
  }

  Future<void> initializeUsername() async {
    username.text = userController.user.value.username;
  }

  Future<void> updateUsername() async {
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
      if (!updateUsernameController.currentState!.validate()) {
        VFullScreenLoader.stopLoading();
        return;
      }

      // Update user first and lastname in the Firebase Firestore
      Map<String, dynamic> name = {'Username': username.text.trim()};
      await userRepository.updateSingleField(name);

      // Update Rx user value
      userController.user.value.username = username.text.trim();

      // Remove loader
      VFullScreenLoader.stopLoading();

      Get.back();

      // Show success message
      VLoaders.successSnackBar(title: 'Congratulations!', message: 'Your username has been updated successfully!');

    } catch (e) {
      VFullScreenLoader.stopLoading();
      VLoaders.errorSnackBar(title: 'Unexpected error!', message: e.toString());
    }
  }
}