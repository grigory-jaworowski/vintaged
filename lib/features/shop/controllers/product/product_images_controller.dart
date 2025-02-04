import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../utils/constants/sizes.dart';
import '../../../../utils/popups/loaders.dart';
import '../../models/product_model.dart';

class ProductImagesController extends GetxController {
  static ProductImagesController get instance => Get.find();

  RxString selectedProductImage = ''.obs;

  // Lists to store additional product images
  final RxList<XFile> productImages = <XFile>[].obs;

  /// -- Get All Images from product and Variations
  List<String> getAllProductImages(ProductModel product) {
    // Use Set to add unique images only
    Set<String> images = {};

    selectedProductImage.value = product.images.first;

    // Get all images from the Product Model if not null.
    images.addAll(product.images);

    return images.toList();
  }

  /// -- Show Image Popup
  void showEnlargedImage(String image) {
    Get.to(
      fullscreenDialog: true,
      () => Dialog.fullscreen(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: VSizes.defaultSpace * 2, horizontal: VSizes.defaultSpace),
                child: CachedNetworkImage(imageUrl: image),
              ),
              const SizedBox(height: VSizes.spaceBtwSections),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: 150,
                  child: OutlinedButton(onPressed: () => Get.back(), child: const Text('Close')),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  selectMultiplePictures() async {
    try {
      final images = await ImagePicker().pickMultiImage(limit: 5);
      if (images.isNotEmpty) {
        productImages.addAll(images);
      }
    } catch (e) {
      VLoaders.errorSnackBar(title: 'Unexpected Error!', message: 'Something went wrong: $e');
    }
  }
  
  /// Function to remove Product image
  Future<void> removeImage(XFile image) async {
    productImages.remove(image);
  }
}