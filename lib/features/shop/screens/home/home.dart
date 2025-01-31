import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:vintaged/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:vintaged/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:vintaged/common/widgets/layouts/grid_layout.dart';
import 'package:vintaged/common/widgets/products/product_card/product_card.dart';
import 'package:vintaged/common/widgets/shimmers/vertical_shimmer.dart';
import 'package:vintaged/features/shop/screens/home/widgets/home_app_bar.dart';
import 'package:vintaged/features/shop/screens/home/widgets/home_categories.dart';
import 'package:vintaged/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:vintaged/utils/constants/sizes.dart';

import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/colors.dart';
import '../../controllers/product/product_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const VPrimaryHeaderContainer(
              child: Column(
                children: [
                  // Appbar
                  VHomeAppBar(),
                  SizedBox(height: VSizes.spaceBtwSections),

                  // Searchbar
                  VSearchContainer(
                      text: 'Search for Items',
                      icon: Iconsax.search_normal,
                      showBorder: true),
                  SizedBox(height: VSizes.spaceBtwSections),

                  // Categories
                  VHomeCategories(),
                  SizedBox(height: VSizes.spaceBtwSections),
                ],
              ),
            ),

            // Body
            Padding(
              padding: const EdgeInsets.all(VSizes.defaultSpace),
              child: Column(
                children: [
                  const VPromoSlider(),
                  const SizedBox(height: VSizes.spaceBtwSections),
                  const VSectionHeading(
                      title: 'Popular items',
                      showActionButton: false,
                      textColor: VColors.dark),
                  const SizedBox(height: VSizes.spaceBtwItems),
                  Obx(() {
                    if (controller.isLoading.value) {
                      return const VerticalProductShimmer(itemCount: 1);
                    }

                    if (controller.popularProducts.isEmpty) {
                      return Center(
                          child: Text('No Data Found!',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .apply(color: VColors.dark)));
                    } else {
                      return VGridLayout(
                          itemCount: controller.popularProducts.length,
                          itemBuilder: (_, index) =>  VProductCard(product: controller.popularProducts[index]));
                    }
                  }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
