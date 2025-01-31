import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vintaged/features/shop/controllers/category_controller.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../utils/constants/sizes.dart';
import 'sub_categories.dart';
import 'widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryController = CategoryController.instance;
    return Scaffold(
      appBar: const VAppBar(title: Text('Market')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(VSizes.sm),
          child: Obx(() {
            return Column(
              children: [
                ListView.separated(
                  shrinkWrap: true,
                  itemCount: categoryController.parentCategories.length,
                  separatorBuilder: (_, __) =>
                      const SizedBox(height: VSizes.spaceBtwItems),
                  itemBuilder: (_, index) {
                    final category = categoryController.parentCategories[index];
                    return VCategoryItem(
                      image: category.image,
                      title: category.name,
                      onPressed: () {
                        // Fetch subcategories before navigating
                        categoryController.fetchSubCategories(category.id);

                        // Navigate to the SubCategoriesScreen
                        Get.to(() => SubCategoriesScreen(category: category));
                      },
                    );
                  },
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
