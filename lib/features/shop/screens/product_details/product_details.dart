import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../common/widgets/image_widgets/circular_image.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../personalization/screens/profile.dart';
import 'widgets/bottom_buttons.dart';
import 'widgets/co2_add_to_cart.dart';
import 'widgets/product_detail_image_slider.dart';
import 'widgets/product_meta_data.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const VBottomButtons(color: VColors.white, borderColor: VColors.darkGrey),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Product image slider
            const VProductImageSlider(),

            // Product details
            Padding(
              padding: const EdgeInsets.only(right: VSizes.defaultSpace, left: VSizes.defaultSpace, bottom: VSizes.defaultSpace),
              child: Column(
                children: [
                  // Seller
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: const VCircularImage(image: VImages.testAppLogo),
                    title: Text('Name Surname', style: Theme.of(context).textTheme.bodyLarge!.apply(color: VColors.black)),
                    trailing: TextButton(
                      onPressed: () => Get.to(() => const ProfileScreen()),
                      child: const Text('Check Profile'), 
                    ),
                  ),
                  const Divider(color: VColors.grey),

                  // CO2 & Add to cart
                  const VCO2AddToCart(),
                  const Divider(color: VColors.grey),

                  // Price, Title, Brand, Description
                  const VProductMetaData(),

                  // Attributes

                  // Checkout button & Make an offer button

                  // Reviews
                ],
              ),
            )
          ],
           
        ),
      ),
    );
  }
}