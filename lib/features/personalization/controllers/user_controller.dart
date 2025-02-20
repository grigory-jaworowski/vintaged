import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vintaged/data/repositories/authentication/authentication_repository.dart';
import 'package:vintaged/data/repositories/user/user_repository.dart';
import 'package:vintaged/features/authentication/models/user_model.dart';
import 'package:vintaged/features/authentication/screens/login/login_form.dart';
import 'package:vintaged/utils/constants/colors.dart';
import 'package:vintaged/utils/constants/image_strings.dart';
import 'package:vintaged/utils/popups/full_screen_loader.dart';
import 'package:vintaged/utils/popups/loaders.dart';

import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/network_manager.dart';
import '../screens/widgets/reauth_user_login_form.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;

  final hidePassword = true.obs;
  final imageUploading = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    fetchUserRecord();
    super.onInit();
  }

  @override
  void refresh() {
    fetchUserRecord();
    super.refresh();
  }

  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  // Save user record
  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      if (userCredentials != null) {}
    } catch (e) {
      VLoaders.warningSnackBar(
          title: 'Data not saved',
          message:
              'Something went wrong while saving your information. You can try to re-save your data in your Profile.');
    }
  }

  void deleteAccountWarningPopup() {
    Get.defaultDialog(
        contentPadding: const EdgeInsets.all(VSizes.md),
        title: 'Delete Account',
        middleText: 'Are you sure you want to delete yor account?',
        confirm: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: VColors.red, side: const BorderSide(color: VColors.red)),
          onPressed: () => Get.to(() => const ReauthUserLoginForm()),
          child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: VSizes.lg),
              child: Text('Delete')),
        ),
        cancel: OutlinedButton(
          style: OutlinedButton.styleFrom(side: const BorderSide(color: VColors.dark)),
          child: const Text('Cancel'),
          onPressed: () => Navigator.of(Get.overlayContext!).pop(),
        ));
  }

  // Re-authenticate before deleting
  Future<void> reAuthenticateWithEmailAndPasswordUser() async {
    try {
      // Start loading
      VFullScreenLoader.openLoadingDialog(
          'Processing...', VImages.docerAnimation);

      // Check internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        VFullScreenLoader.stopLoading();
        return;
      }

      // Form validation
      if (!reAuthFormKey.currentState!.validate()) {
        VFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance
          .reAuthenticateWithEmailAndPassword(
              verifyEmail.text.trim(), verifyPassword.text.trim());
      await AuthenticationRepository.instance.deleteAccount();
      VFullScreenLoader.stopLoading();
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      VFullScreenLoader.stopLoading();
      VLoaders.warningSnackBar(
          title: 'Unexpected error!', message: e.toString());
    }
  }

  uploadProfilePicture() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 70, maxHeight: 512, maxWidth: 512);
      if (image != null) {
        imageUploading.value = true;
        // Upload image
        final imageUrl = await userRepository.uploadImage('Users/Images/Profile/', image);
        // Update user image record
        Map<String, dynamic> json = {'ProfilePicture': imageUrl};
        await userRepository.updateSingleField(json);

        user.value.profilePicture = imageUrl;
        user.refresh();
        VLoaders.successSnackBar(title: 'Congratulations!', message: 'Your profile image has been updated!');
      }
    } catch (e) {
      VLoaders.errorSnackBar(title: 'Unexpected Error!', message: 'Something went wrong: $e');
    } finally {
      imageUploading.value = false;
    }
  }
}
