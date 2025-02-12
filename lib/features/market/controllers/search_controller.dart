import 'package:get/get.dart';

import '../../../data/repositories/products/product_repository.dart';
import '../../../utils/popups/loaders.dart';
import '../models/product_model.dart';

class VSearchController extends GetxController {
  static VSearchController get instance => Get.find();
  RxList<ProductModel> searchResults = <ProductModel>[].obs;
  RxBool isLoading = false.obs;
  RxString lastSearchQuery = ''.obs;

  void searchProducts(String query) async {
    lastSearchQuery.value = query;
    isLoading.value = true;

    try {
      final results = await ProductRepository.instance
          .searchProducts(query);

      // Update searchResults with sorted results
      searchResults.assignAll(results);
    } catch (e) {
      VLoaders.errorSnackBar(title: 'Unexpected Error!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}