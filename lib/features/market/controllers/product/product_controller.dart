import 'package:get/get.dart';

import '../../../../data/repositories/products/product_repository.dart';
import '../../../../utils/popups/loaders.dart';
import '../../models/product_model.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  final isLoading = false.obs;
  final _productRepository = Get.put(ProductRepository());
  RxList<ProductModel> popularProducts = <ProductModel>[].obs;

  @override
  void onInit() {
    fetchPopularProducts();
    super.onInit();
  }

  void fetchPopularProducts() async {
    try {
      isLoading.value = true;

      final products = await _productRepository.getPopularProducts();

      popularProducts.assignAll(products);
    } catch (e) {
      VLoaders.errorSnackBar(title: 'Unexpected Error!', message: 'Something went wrong: $e');
    } finally {
      isLoading.value = false;
    }
  }
}