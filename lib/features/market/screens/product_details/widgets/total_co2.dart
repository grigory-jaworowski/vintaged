import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:vintaged/common/widgets/custom_shapes/containers/circular_container.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../controllers/product/product_details_controller.dart';
import '../../../models/product_model.dart';

class VTotalCO2 extends StatelessWidget {
  const VTotalCO2({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final productDetailsController = ProductDetailsController.instance;
    productDetailsController.setTotalCO2Value(product.weight, product.co2);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: VSizes.sm),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // CO2 Icon and Text
          const Icon(Iconsax.cloud_snow, color: VColors.dark, size: 24),
                const SizedBox(width: VSizes.spaceBtwItems / 2),
                Obx(() {
            return Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: productDetailsController.totalCO2Value.value.toStringAsFixed(1), style: Theme.of(context).textTheme.bodyLarge),
                  TextSpan(text: ' kg CO₂e - based on item & location', style: Theme.of(context).textTheme.bodyLarge),
                ],
              ),
            );
          }),
      
          const SizedBox(width: VSizes.spaceBtwItems / 2),
      
          Obx(() {
            return VCircularContainer(
              backgroundColor: productDetailsController.co2Color.value,
              radius: 100,
              height: 20,
              width: 20,
            );
          }),
        ],
      ),
    );
  }
}
