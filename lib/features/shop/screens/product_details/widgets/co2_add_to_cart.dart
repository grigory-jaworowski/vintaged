import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:vintaged/common/widgets/custom_shapes/containers/circular_container.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class VCO2AddToCart extends StatelessWidget {
  const VCO2AddToCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // CO2
        Row(
          children: [
            const Icon(Iconsax.cloud_snow, color: VColors.dark, size: 24),
            const SizedBox(width: VSizes.spaceBtwItems / 2),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: 'CO2', style: Theme.of(context).textTheme.bodyLarge),
                  const TextSpan(text: '(123)'),
                ]
              )
            ),
            const SizedBox(width: VSizes.spaceBtwItems / 2),
            const VCircularContainer(backgroundColor: VColors.red, radius: 100, height: 20, width: 20),
          ],
        ),
        // Add to cart button
        TextButton(onPressed: () {}, child: const Text('Calculate'))
      ],
    );
  }
}