import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:vintaged/utils/constants/colors.dart';
import 'package:vintaged/utils/constants/sizes.dart';

import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';

class VOrderListItems extends StatelessWidget {
  const VOrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 2,
      separatorBuilder: (_,__) => const SizedBox(height: VSizes.spaceBtwItems),
      itemBuilder: (_, index) => VRoundedContainer(
        padding: const EdgeInsets.all(VSizes.md),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Row 1
            Row(
              children: [
                // 1 - Icon
                const Icon(Iconsax.ship),
                const SizedBox(width: VSizes.spaceBtwItems / 2),
      
                // 2 Status & Date
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Processing',
                      style: Theme.of(context).textTheme.bodyLarge!.apply(color: VColors.brown, fontWeightDelta: 2),
                    ),
                    Text('18 Jan 2025', style: Theme.of(context).textTheme.headlineSmall),
                  ],
                )
              ],
            ),
            const SizedBox(height: VSizes.spaceBtwItems),
      
            // Row 2
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      // 1 - Icon
                      const Icon(Iconsax.tag),
                      const SizedBox(width: VSizes.spaceBtwItems / 2),
                  
                      // 2 Status & Date
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Purchase',
                              style: Theme.of(context).textTheme.bodyLarge!.apply(color: VColors.dark, fontWeightDelta: 1),
                            ),
                            Text('#134435', style: Theme.of(context).textTheme.labelMedium),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      // 1 - Icon
                      const Icon(Iconsax.ship),
                      const SizedBox(width: VSizes.spaceBtwItems / 2),
                  
                      // 2 Status & Date
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Purchase Date',
                              style: Theme.of(context).textTheme.bodyLarge!.apply(color: VColors.dark, fontWeightDelta: 1),
                            ),
                            Text('18 Jan 2025', style: Theme.of(context).textTheme.labelMedium),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}