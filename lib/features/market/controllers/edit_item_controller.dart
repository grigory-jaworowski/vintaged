import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vintaged/features/market/controllers/category_controller.dart';
import 'package:vintaged/features/market/models/product_model.dart';

import '../../../data/repositories/authentication/authentication_repository.dart';
import '../../../data/repositories/products/product_repository.dart';
import '../../../data/services/climatiq_api_service.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/helpers/network_manager.dart';
import '../../../utils/popups/full_screen_loader.dart';
import '../../../utils/popups/loaders.dart';
import 'my_items_controller.dart';
import 'product/product_images_controller.dart';

class EditItemController extends GetxController {
  static EditItemController get instance => Get.find();

  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController brand = TextEditingController();
  TextEditingController size = TextEditingController();
  TextEditingController weight = TextEditingController();
  TextEditingController price = TextEditingController();

  Rx<String?> selectedCondition = Rx<String?>(null);

  final editItemFormKey = GlobalKey<FormState>();

  final productRepository = Get.put(ProductRepository());
  Rx<ProductModel?> productToEdit = Rx<ProductModel?>(null);
  final imagesController = ProductImagesController.instance;
  final climatiqApiService = Get.put(ClimatiqApiService());
  final categoryController = CategoryController.instance;

  void initializeProduct(ProductModel product) {
    title.text = product.title;
    description.text = product.description;
    brand.text = product.brand;
    size.text = product.size;
    weight.text = product.weight.toString();
    price.text = product.price.toString();
    selectedCondition.value = product.condition;
    productToEdit.value = product;
  }

  Future<void> updateProduct() async {
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

      if (!editItemFormKey.currentState!.validate()) {
        VFullScreenLoader.stopLoading();
        return;
      }

      if (imagesController.productImages.length +
              imagesController.existingProductImages.length ==
          0) {
        VFullScreenLoader.stopLoading();
        VLoaders.errorSnackBar(
            title: 'Image Error!', message: 'At least one image is required.');
        return;
      }

      // Call ClimatiqApiService
      double co2Estimate = await climatiqApiService.estimateCO2(
          weight: double.tryParse(weight.text.trim()) ?? 0);

      // Delete images marked for removal
      await deleteImagesFromFirestoreAndStorage();

      // Upload new images (if any)
      List<String> uploadedImages = await productRepository
          .uploadMultipleImages('Shop/Images/', imagesController.productImages);

      List<String> finalImages = {
        ...imagesController.existingProductImages, // Keep old images
        ...uploadedImages // Add new images
      }.toList();

      final updatedProduct = ProductModel(
        id: productToEdit.value!.id,
        co2: co2Estimate,
        title: title.text.trim(),
        brand: brand.text.trim(),
        description: description.text.trim(),
        price: double.tryParse(price.text.trim()) ?? 0,
        images: finalImages,
        condition: selectedCondition.value!,
        isFeatured: false,
        categoryId: categoryController.selectedParentCategory.value!.id,
        owner: AuthenticationRepository.instance.authUser!.uid,
        size: size.text.trim(),
        subCategoryId: categoryController.selectedSubCategory.value!.id,
        weight: double.tryParse(weight.text.trim()) ?? 0,
      );

      // Call repository method to update product in Firestore
      await productRepository.updateProduct(updatedProduct);

      // Remove loader & show success message
      VFullScreenLoader.stopLoading();

      MyItemsController.instance.refresh();

      // Go back to the previous screen after update
      Get.back();

      VLoaders.successSnackBar(
          title: 'Success!', message: 'Product updated successfully.');
    } catch (e) {
      VFullScreenLoader.stopLoading();
      VLoaders.errorSnackBar(title: 'Unexpected Error!', message: e.toString());
    }
  }

  Future<void> deleteImagesFromFirestoreAndStorage() async {
    for (String imageUrl in imagesController.toBeDeletedImages) {
      try {
        // Delete from Firebase Storage
        await productRepository.deleteImageFromStorage(imageUrl);
      } catch (e) {
        VLoaders.errorSnackBar(
            title: 'Unexpected Error!', message: e.toString());
      }
    }
    // Clear 'toBeDeletedImages' after deletion
    imagesController.toBeDeletedImages.clear();
  }
}
