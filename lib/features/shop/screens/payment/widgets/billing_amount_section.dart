import 'package:flutter/material.dart';
import 'package:vintaged/utils/constants/sizes.dart';

import '../../../../../utils/helpers/pricing_calculator.dart';
import '../../../models/product_model.dart';

class VBillingAmountSection extends StatelessWidget {
  const VBillingAmountSection({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Subtotal
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Subtotal', style: Theme.of(context).textTheme.bodyMedium),
            Text('€${product.price}', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: VSizes.spaceBtwItems / 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Shipping Fee', style: Theme.of(context).textTheme.bodyMedium),
            Text('€${VPricingCalculator.calculateShippingCost(product.price, 'ES')}', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: VSizes.spaceBtwItems / 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Tax Fee', style: Theme.of(context).textTheme.bodyMedium),
            Text('€${VPricingCalculator.calculateTax(product.price, 'ES')}', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: VSizes.spaceBtwItems / 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Total', style: Theme.of(context).textTheme.bodyMedium),
            Text('€${VPricingCalculator.calculateTotalPrice(product.price, 'ES')}', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),

      ],
    );
  }
}