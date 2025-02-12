import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vintaged/data/repositories/user/user_repository.dart';
import 'package:vintaged/features/personalization/controllers/user_controller.dart';
import 'package:vintaged/utils/constants/image_strings.dart';
import 'package:vintaged/utils/popups/full_screen_loader.dart';
import 'package:vintaged/utils/popups/loaders.dart';

import '../../../utils/helpers/network_manager.dart';

class UpdateNameController extends GetxController{
  static UpdateNameController get instance => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateNameController = GlobalKey<FormState>();

  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }

  Future<void> initializeNames() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName; 
  }

  Future<void> updateUserName() async {
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
      if (!updateNameController.currentState!.validate()) {
        VFullScreenLoader.stopLoading();
        return;
      }

      // Update user first and lastname in the Firebase Firestore
      Map<String, dynamic> name = {'FirstName': firstName.text.trim(), 'LastName': lastName.text.trim()};
      await userRepository.updateSingleField(name);

      // Update Rx user value
      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      // Remove loader
      VFullScreenLoader.stopLoading();

      Get.back();
      
      // Show success message
      VLoaders.successSnackBar(title: 'Congratulations!', message: 'Your name has been updated successfully!');
      
    } catch (e) {
      VFullScreenLoader.stopLoading();
      VLoaders.errorSnackBar(title: 'Unexpected error!', message: e.toString());
    }
  }
}