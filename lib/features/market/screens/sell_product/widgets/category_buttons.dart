import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vintaged/features/market/controllers/category_controller.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/validators/validators.dart';
import '../../../controllers/sell_product_controller.dart';

class VCategoryDropdownButtons extends StatelessWidget {
  const VCategoryDropdownButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final categoryController = CategoryController.instance;
    final sellProductController = SellProductController.instance;
    return Form(
      key: sellProductController.dropdownsFormKey,
      child: Column(children: [
        Obx(
          () => DropdownButtonFormField(
            validator: (value) => Validator.validateCategories('category', value),
            decoration: const InputDecoration(labelText: 'Category'),
            value: categoryController.selectedParentCategory.value,
            onChanged: (value) {
              categoryController.selectParentCategory(value);
            },
            items: categoryController.parentCategories
                .map((category) =>
                    DropdownMenuItem(value: category, child: Text(category.name)))
                .toList(),
          ),
        ),
        const SizedBox(height: VSizes.spaceBtwInputFields),
        Obx(
          () => DropdownButtonFormField(
            validator: (value) => Validator.validateCategories('subcategory', value),
            decoration: const InputDecoration(labelText: 'Subcategory'),
            value: categoryController.selectedSubCategory.value,
            onChanged: (value) {
              categoryController.selectedSubCategory.value = value;
            },
            items: categoryController.subCategories
                .map((category) =>
                    DropdownMenuItem(value: category, child: Text(category.name)))
                .toList(),
          ),
        ),
      ]),
    );
  }
}