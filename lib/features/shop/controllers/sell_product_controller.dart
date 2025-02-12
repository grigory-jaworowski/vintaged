import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vintaged/features/shop/controllers/category_controller.dart';
import 'package:vintaged/features/shop/controllers/product/product_images_controller.dart';

import '../../../data/repositories/authentication/authentication_repository.dart';
import '../../../data/repositories/products/product_repository.dart';
import '../../../data/services/climatiq_api_service.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/helpers/network_manager.dart';
import '../../../utils/popups/full_screen_loader.dart';
import '../../../utils/popups/loaders.dart';
import '../models/product_model.dart';

class SellProductController extends GetxController {
  static SellProductController get instance => Get.find();

  final isLoading = false.obs;
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController brand = TextEditingController();
  TextEditingController size = TextEditingController();
  TextEditingController weight = TextEditingController();
  TextEditingController price = TextEditingController();

  Rx<String?> selectedCondition = Rx<String?>(null);

  final categoryController = CategoryController.instance;
  final imagesController = ProductImagesController.instance;
  final climatiqApiService = Get.put(ClimatiqApiService());

  // Controllers and keys
  final productRepository = Get.put(ProductRepository());
  final dropdownsFormKey = GlobalKey<FormState>();
  final attributesFormKey = GlobalKey<FormState>();
  final titleDescriptionFormKey = GlobalKey<FormState>();

  Future<void> createProduct() async {
    try {
      // Show progress dialog
      VFullScreenLoader.openLoadingDialog(
          'Processing data...', VImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        VFullScreenLoader.stopLoading();
        return;
      }

      // Validate at least one image
      if (imagesController.productImages.isEmpty) throw 'Please select at least one image';

      // Validate title and description form
      if (!titleDescriptionFormKey.currentState!.validate()) {
        VFullScreenLoader.stopLoading();
        return;
      }

      // Validate categories form
      if (!dropdownsFormKey.currentState!.validate()) {
        VFullScreenLoader.stopLoading();
        return;
      }

      // Validate item attributes form
      if (!attributesFormKey.currentState!.validate()) {
        VFullScreenLoader.stopLoading();
        return;
      }

      // Upload images
      final images = await productRepository.uploadMultipleImages(
          'Shop/Images/', imagesController.productImages);

      // Call ClimatiqApiService
      double co2Estimate = await climatiqApiService.estimateCO2(
          weight: double.tryParse(weight.text.trim()) ?? 0);

      // Map Product Data to ProductModel
      final newProduct = ProductModel(
        id: '',
        co2: co2Estimate,
        title: title.text.trim(),
        brand: brand.text.trim(),
        description: description.text.trim(),
        price: double.tryParse(price.text.trim()) ?? 0,
        images: images,
        condition: selectedCondition.value!,
        isFeatured: false,
        categoryId: categoryController.selectedParentCategory.value!.id,
        owner: AuthenticationRepository.instance.authUser!.uid,
        size: size.text.trim(),
        subCategoryId: categoryController.selectedSubCategory.value!.id,
        weight: double.tryParse(weight.text.trim()) ?? 0,
      );

      newProduct.id =
          await ProductRepository.instance.createProduct(newProduct);

      if (newProduct.id.isEmpty) throw 'Error storing data. Try again';

      VFullScreenLoader.stopLoading();

      resetForm();

      // Show Success Message
      VLoaders.successSnackBar(
          title: 'Congratulations',
          message: 'Item has been successfully added to the Market!');
    } catch (e) {
      VFullScreenLoader.stopLoading();
      VLoaders.errorSnackBar(title: 'Unexpected Error!', message: e.toString());
    }
  }

  void resetForm() {
    title.clear();
    description.clear();
    brand.clear();
    size.clear();
    weight.clear();
    price.clear();
    categoryController.selectedSubCategory.value = null;
    categoryController.selectedParentCategory.value = null;
    selectedCondition.value = null;
    imagesController.productImages.clear();
  }
}
