import 'package:get/get.dart';

import '../../../data/repositories/categories/category_repository.dart';
import '../../../utils/popups/loaders.dart';
import '../models/category_model.dart';
import '../models/product_model.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final isLoading = false.obs;
  final _categoryRepository = Get.put(CategoryRepository());
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> parentCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> subCategories = <CategoryModel>[].obs;
  Rx<CategoryModel?> selectedParentCategory = Rx<CategoryModel?>(null);
  Rx<CategoryModel?> selectedSubCategory = Rx<CategoryModel?>(null);

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
      featuredCategories.assignAll(allCategories
          .where((category) => category.isFeatured)
          .take(7)
          .toList());

      parentCategories.assignAll(
          allCategories.where((category) => category.parendId.isEmpty));
    } catch (e) {
      VLoaders.errorSnackBar(
          title: 'Unexpected Error!', message: 'Something went wrong: $e');
    } finally {
      isLoading.value = false;
    }
  }

  void loadProductCategories(ProductModel product) {
    // Find the parent category that matches the product's category
    final parentCategory = parentCategories
        .firstWhereOrNull((category) => category.id == product.categoryId);

    // Set the selected parent category
    selectedParentCategory.value = parentCategory;

    // If a parent category exists, fetch subcategories and set the selected subcategory
    if (parentCategory != null) {
      fetchSubCategories(parentCategory.id);

      // Find the subcategory that matches the product's subcategory
      final subCategory = subCategories
          .firstWhereOrNull((category) => category.id == product.subCategoryId);

      // Set the selected subcategory
      selectedSubCategory.value = subCategory;
    }
  }

  // Fetch subcategories based on selected parent category
  void fetchSubCategories(String categoryId) {
    subCategories.assignAll(allCategories.where((category) =>
        category.id.startsWith(categoryId) && category.parendId.isNotEmpty));
  }

  // Handle parent category selection
  void selectParentCategory(CategoryModel? category) {
    selectedParentCategory.value = category;
    selectedSubCategory.value = null;
    subCategories.clear();
    if (category != null) {
      fetchSubCategories(category.id);
    }
  }
}
