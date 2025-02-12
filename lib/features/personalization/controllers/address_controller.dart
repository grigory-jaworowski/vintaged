import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vintaged/features/personalization/controllers/user_controller.dart';

import '../../../data/repositories/address/address_repository.dart';
import '../../../data/repositories/authentication/authentication_repository.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/helpers/network_manager.dart';
import '../../../utils/popups/full_screen_loader.dart';
import '../../../utils/popups/loaders.dart';
import '../models/address_model.dart';

class AddressController extends GetxController {
  static AddressController get instance => Get.find();

  final street = TextEditingController();
  final postalCode = TextEditingController();
  final city = TextEditingController();
  final province = TextEditingController();
  final country = TextEditingController();
  GlobalKey<FormState> addressFormKey = GlobalKey<FormState>();

  RxBool refreshData = true.obs;
  final userController = UserController.instance;
  final addressRepository = Get.put(AddressRepository());
  final Rx<bool> billingSameAsShipping = true.obs;

  @override
  void onInit() {
    initializeAddress();
    super.onInit();
  }

  Future<void> initializeAddress() async {
    street.text = userController.user.value.address?.street ?? '';
    postalCode.text = userController.user.value.address?.postalCode ?? '';
    city.text = userController.user.value.address?.city ?? '';
    province.text = userController.user.value.address?.province ?? '';
    country.text = userController.user.value.address?.country ?? '';
  }

  /// Add new Address
  addNewAddresses() async {
    try {
      // Start Loading
      VFullScreenLoader.openLoadingDialog(
          'Storing Address...', VImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        VFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!addressFormKey.currentState!.validate()) {
        VFullScreenLoader.stopLoading();
        return;
      }

      // Save Address Data
      final address = AddressModel(
        street: street.text.trim(),
        city: city.text.trim(),
        province: province.text.trim(),
        postalCode: postalCode.text.trim(),
        country: country.text.trim(),
      );

      await addressRepository.saveAddress(
          address, AuthenticationRepository.instance.authUser!.uid);

      // Update user data
      userController.user.value.address = address;
      userController.user.refresh();

      // Remove Loader
      VFullScreenLoader.stopLoading();

      Get.back();
      
      // Show Success Message
      VLoaders.successSnackBar(
          title: 'Congratulations',
          message: 'Your address has been saved successfully.');
    } catch (e) {
      VFullScreenLoader.stopLoading();
      VLoaders.errorSnackBar(title: 'Unexpected error!', message: e.toString());
    }
  }
}
