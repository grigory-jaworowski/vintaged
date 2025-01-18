import 'package:flutter/material.dart';
import 'package:vintaged/utils/constants/sizes.dart';

class VBillingAmountSection extends StatelessWidget {
  const VBillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Subtotal
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Subtotal', style: Theme.of(context).textTheme.bodyMedium),
            Text('\$40', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: VSizes.spaceBtwItems / 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Shipping Fee', style: Theme.of(context).textTheme.bodyMedium),
            Text('\$4', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: VSizes.spaceBtwItems / 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Tax Fee', style: Theme.of(context).textTheme.bodyMedium),
            Text('\$4', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: VSizes.spaceBtwItems / 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Total', style: Theme.of(context).textTheme.bodyMedium),
            Text('\$48', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),

      ],
    );
  }
}