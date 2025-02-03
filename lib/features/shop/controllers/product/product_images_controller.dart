import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../utils/popups/loaders.dart';

class ProductImagesController extends GetxController {
  static ProductImagesController get instance => Get.find();

  Rx<String?> selectedProductImage = Rx<String?>(null);

  // Lists to store additional product images
  final RxList<XFile> productImages = <XFile>[].obs;

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