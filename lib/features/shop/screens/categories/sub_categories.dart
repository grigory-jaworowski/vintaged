import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../all_products/all_products.dart';
import 'widgets/category_item.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const VAppBar(title: Text('Market'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(VSizes.sm),
          child: Column(
            children: [
              
              const VSearchContainer(text: 'Search for Items', icon: Iconsax.search_normal, showBorder: true),
              const SizedBox(height: VSizes.spaceBtwItems),

              ListView.separated(
                shrinkWrap: true,
                itemCount: 1,
                separatorBuilder: (_, __) => const SizedBox(height: VSizes.spaceBtwItems),
                itemBuilder: (_, index) => VCategoryItem(image: VImages.shirtIcon, title: 'Clothes', onPressed: () => Get.to(() => const AllProducts())),
              ),
            ],
          ),
        ),
      ),
    );
  }
}