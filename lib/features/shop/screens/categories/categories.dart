import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:vintaged/utils/constants/image_strings.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../personalization/screens/profile.dart';
import 'sub_categories.dart';
import 'widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const VAppBar(title: Text('Market')),
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
                itemBuilder: (_, index) => VCategoryItem(image: VImages.allProductsIcon, title: 'All Products', onPressed: () => Get.to(() => const SubCategoriesScreen())),
              ),
            ],
          ),
        ),
      ),
    );
  }
}