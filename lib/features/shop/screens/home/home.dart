import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:vintaged/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:vintaged/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:vintaged/features/shop/screens/home/widgets/home_app_bar.dart';
import 'package:vintaged/features/shop/screens/home/widgets/home_categories.dart';
import 'package:vintaged/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:vintaged/utils/constants/image_strings.dart';
import 'package:vintaged/utils/constants/sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            VPrimaryHeaderContainer(
              child: Column(
                children: [
                  // Appbar
                  VHomeAppBar(),
                  SizedBox(height: VSizes.spaceBtwSections),

                  // Searchbar
                  VSearchContainer(text: 'Search for Items', icon: Iconsax.search_normal, showBorder: true),
                  SizedBox(height: VSizes.spaceBtwSections),
                  
                  // Categories
                  VHomeCategories(),

                ],
              ),
            ),

            // Body
            Padding(
              padding: EdgeInsets.all(VSizes.defaultSpace),
              child: VPromoSlider(banners: [VImages.promoBanner1, VImages.promoBanner2],),
            )
          ],
        ),
      ),
    );
  }
}