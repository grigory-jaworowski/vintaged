import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:vintaged/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:vintaged/utils/constants/colors.dart';
import 'package:vintaged/utils/constants/sizes.dart';

import '../../../../../common/widgets/image_widgets/circular_image.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../personalization/screens/profile.dart';

class VProductMetaData extends StatelessWidget {
  const VProductMetaData({super.key});

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
            Text('40€', style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: VSizes.spaceBtwItems / 2),
            const Divider(color: VColors.grey),
            const SizedBox(height: VSizes.spaceBtwItems),

            // Title
            Text('Leather Jacket', style: Theme.of(context).textTheme.titleLarge),
            SizedBox(
              height: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Very good', style: Theme.of(context).textTheme.labelLarge),
                  const VerticalDivider(thickness: 2, color: VColors.grey),
                  Text('Size M', style: Theme.of(context).textTheme.labelLarge),
                ],
              ),
            ),
            const SizedBox(height: VSizes.spaceBtwItems),

            // Description
            VRoundedContainer(
              radius: 10,
              borderColor: VColors.grey,
              backgroundColor: VColors.textWhite,
              padding: const EdgeInsets.all(VSizes.sm),
              child: Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged',
              style: Theme.of(context).textTheme.bodyLarge),
            )
          ],
        )
      ],
    );
  }
}