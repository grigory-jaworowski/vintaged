import 'package:flutter/material.dart';
import 'package:vintaged/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:vintaged/features/market/models/product_model.dart';
import 'package:vintaged/utils/constants/colors.dart';
import 'package:vintaged/utils/constants/sizes.dart';

class VProductMetaData extends StatelessWidget {
  const VProductMetaData({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Price & Sale Price
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Price
            const SizedBox(height: VSizes.spaceBtwItems / 2),
            Text('€${product.price.toStringAsFixed(2)}',
                style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: VSizes.spaceBtwItems / 2),
            const Divider(color: VColors.grey),
            const SizedBox(height: VSizes.spaceBtwItems),

            // Title
            Text(product.title, style: Theme.of(context).textTheme.titleLarge),
            SizedBox(
              height: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(product.brand,
                      style: Theme.of(context).textTheme.labelLarge),
                  const VerticalDivider(thickness: 2, color: VColors.grey),
                  Text(product.condition,
                      style: Theme.of(context).textTheme.labelLarge),
                  const VerticalDivider(thickness: 2, color: VColors.grey),
                  Text(product.size,
                      style: Theme.of(context).textTheme.labelLarge),
                ],
              ),
            ),
            const SizedBox(height: VSizes.spaceBtwItems),

            // Description
            VRoundedContainer(
              radius: 10,
              width: double.infinity,
              borderColor: VColors.grey,
              backgroundColor: VColors.white,
              padding: const EdgeInsets.all(VSizes.sm),
              child: Text(product.description,
                  style: Theme.of(context).textTheme.bodyLarge),
            )
          ],
        )
      ],
    );
  }
}
