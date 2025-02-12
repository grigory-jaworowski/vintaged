import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/repositories/products/product_repository.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/popups/loaders.dart';
import '../models/product_model.dart';

class MyItemsController extends GetxController {
  static MyItemsController get instance => Get.find();

  final productRepository = ProductRepository.instance;
  RxList<ProductModel> myProducts = <ProductModel>[].obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchMyProducts();
  }

  @override
  void refresh() {
    fetchMyProducts();
    super.refresh();
  }

  void deleteProduct(ProductModel product) {
    Get.defaultDialog(
      title: 'Delete Item',
      content: const Text('Are you sure you want to delete this item?'),
      confirm: SizedBox(
        width: 90,
        child: ElevatedButton(
          onPressed: () async {
            // Close the dialog first
            Get.back();

            // Call performDelete
            await performDelete(product);
          },
          style: OutlinedButton.styleFrom(
              backgroundColor: VColors.red,
              side: const BorderSide(color: VColors.red)),
          child: const Text('Delete'),
        ),
      ),
      cancel: SizedBox(
        width: 90,
        child: OutlinedButton(
          onPressed: () => Get.back(),
          style: OutlinedButton.styleFrom(
              side: const BorderSide(color: VColors.dark)),
          child: const Text('Cancel'),
        ),
      ),
    );
  }
  
  Future<void> performDelete(ProductModel product) async {
    try {
      // Start loading
      isLoading.value = true;

      // Delete images first
      for (String imageUrl in product.images) {
        await productRepository.deleteImageFromStorage(imageUrl);
      }

      // Delete product from Firestore
      await productRepository.deleteProduct(product.id);

      // Remove from local list (update UI immediately)
      myProducts.removeWhere((p) => p.id == product.id);

      // Show success message
      VLoaders.successSnackBar(
          title: 'Success', message: 'Product deleted successfully!');
    } catch (e) {
      VLoaders.errorSnackBar(title: 'Error', message: e.toString());
    } finally {
      // Stop loading
      isLoading.value = false;
    }
  }

  Future<void> fetchMyProducts() async {
    try {
      isLoading.value = true;
      final products = await productRepository.getUserProducts();
      myProducts.assignAll(products);
    } catch (e) {
      VLoaders.errorSnackBar(title: "Error", message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
