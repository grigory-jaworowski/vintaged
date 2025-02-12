import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:vintaged/features/shop/models/category_model.dart';
import 'package:vintaged/utils/constants/image_strings.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../data/repositories/products/product_repository.dart';
import '../../../../utils/constants/sizes.dart';
import '../../controllers/category_controller.dart';
import '../all_products/all_products.dart';
import 'widgets/category_item.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final categoryController = CategoryController.instance;
    return Scaffold(
      appBar: VAppBar(title: Text(category.name), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(VSizes.sm),
            child: Obx(() {
              final parentCategory = categoryController.selectedParentCategory;
              return Column(
                children: [
                  const VSearchContainer(
                      text: 'Search for Items',
                      icon: Iconsax.search_normal,
                      showBorder: true),
                  const SizedBox(height: VSizes.spaceBtwItems),
                  VCategoryItem(
                    isNetworkImage: false,
                    image: VImages.allProductsIcon,
                    title: 'All products',
                    onPressed: () {
                      Get.to(() => AllProducts(
                            title: 'All products',
                            futureMethod: ProductRepository.instance
                                .getProductsByCategory(field: 'CategoryId', categoryId: parentCategory.value?.id ?? ''),
                          ));
                    },
                  ),
                  const SizedBox(height: VSizes.spaceBtwItems),
                  ListView.separated(
                    shrinkWrap: true,
                    itemCount: categoryController.subCategories.length,
                    separatorBuilder: (_, __) =>
                        const SizedBox(height: VSizes.spaceBtwItems),
                    itemBuilder: (_, index) {
                      final subCategory =
                          categoryController.subCategories[index];
                      return VCategoryItem(
                        image: subCategory.image,
                        title: subCategory.name,
                        onPressed: () {
                          Get.to(() => AllProducts(
                                title: subCategory.name,
                                futureMethod: ProductRepository.instance
                                    .getProductsByCategory(
                                        categoryId: subCategory.id,
                                        field: 'SubCategoryId'),
                              ));
                        },
                      );
                    },
                  ),
                ],
              );
            })),
      ),
    );
  }
}
