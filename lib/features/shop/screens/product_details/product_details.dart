import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vintaged/features/shop/models/product_model.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../controllers/product/product_details_controller.dart';
import 'widgets/bottom_buttons.dart';
import 'widgets/owner_details.dart';
import 'widgets/total_co2.dart';
import 'widgets/product_detail_image_slider.dart';
import 'widgets/product_meta_data.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final productDetailsController = Get.put(ProductDetailsController());

    return FutureBuilder(
      future:
          productDetailsController.fetchOwnerRecord(product.owner).then((_) {
        return productDetailsController.setTotalCO2Value(
            product.weight, product.co2);
      }),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator(color: VColors.primary, backgroundColor: VColors.white));
        }

        return SafeArea(
          child: Scaffold(
            bottomNavigationBar: VBottomButtons(
              product: product,
              color: VColors.white,
              borderColor: VColors.darkGrey,
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  // Product image slider
                  VProductImageSlider(product: product),

                  // Product details
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: VSizes.defaultSpace,
                      vertical: VSizes.defaultSpace,
                    ),
                    child: Column(
                      children: [
                        // Seller
                        const VOwnerDetails(),
                        const Divider(color: VColors.grey),

                        // CO2 & Add to cart
                        const SizedBox(height: VSizes.spaceBtwItems / 2),
                        VTotalCO2(product: product),
                        const SizedBox(height: VSizes.spaceBtwItems / 2),

                        const Divider(color: VColors.grey),

                        // Price, Title, Description
                        VProductMetaData(product: product),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
