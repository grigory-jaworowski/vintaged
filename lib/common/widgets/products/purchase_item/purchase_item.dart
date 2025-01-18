import 'package:flutter/material.dart';

import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../image_widgets/rounded_image.dart';
import '../../texts/product_title_text.dart';

class VPurchaseItem extends StatelessWidget {
  const VPurchaseItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const VRoundedImage(
          image: VImages.productImage1,
          width: 100,
          height: 100,
          padding: EdgeInsets.all(VSizes.sm),
        ),
        const SizedBox(width: VSizes.spaceBtwItems),
    
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Flexible(child: VProductTitleText(title: 'Leather Jacket', maxLines: 1)),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: 'Quality ', style: Theme.of(context).textTheme.bodySmall),
                    TextSpan(text: 'Good ', style: Theme.of(context).textTheme.bodyLarge),
                    TextSpan(text: 'Size ', style: Theme.of(context).textTheme.bodySmall),
                    TextSpan(text: 'M ', style: Theme.of(context).textTheme.bodyLarge),
                  ]
                )
              )
            ],
          ),
        )
      ],
    );
  }
}