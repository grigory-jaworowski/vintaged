import 'package:get/get.dart';

import '../../../data/repositories/categories/category_repository.dart';
import '../../../utils/popups/loaders.dart';
import '../models/category_model.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final isLoading = false.obs;
  final _categoryRepository = Get.put(CategoryRepository());
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> parentCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> subCategories = <CategoryModel>[].obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  // Load Categories
  Future<void> fetchCategories() async {
    try {
      // Show loader while loading categories
      isLoading.value = true;

      // Fetch Categories from data source
      final categories = await _categoryRepository.getAllCategories();

      // Update the categories list
      allCategories.assignAll(categories);

      // Filter categories
      featuredCategories.assignAll(allCategories.where((category) => category.isFeatured).take(7).toList());

      parentCategories.assignAll(allCategories.where((category) => category.parendId.isEmpty));
    } catch (e) {
      VLoaders.errorSnackBar(title: 'Unexpected Error!', message: 'Something went wrong: $e');
    } finally {
      isLoading.value = false;
    }
  }

  void fetchSubCategories(String subCategoryId) {
    try {
      subCategories.assignAll(allCategories.where((category) => category.id.startsWith(subCategoryId) && category.parendId.isNotEmpty));
    } catch (e) {
      VLoaders.errorSnackBar(title: 'Unexpected Error!', message: 'Something went wrong: $e');
    } finally {
      isLoading.value = false;
    }
  }

}
