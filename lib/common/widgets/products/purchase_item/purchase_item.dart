import 'package:flutter/material.dart';
import 'package:vintaged/features/market/models/product_model.dart';

import '../../../../utils/constants/sizes.dart';
import '../../image_widgets/rounded_image.dart';
import '../../texts/product_title_text.dart';

class VPurchaseItem extends StatelessWidget {
  const VPurchaseItem({
    super.key, required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        VRoundedImage(
          isNetworkImage: true,
          image: product.images.first,
          width: 80,
          height: 80,
        ),
        const SizedBox(width: VSizes.spaceBtwItems),
    
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(child: VProductTitleText(title: product.title, maxLines: 1)),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: 'Condition ', style: Theme.of(context).textTheme.bodySmall),
                    TextSpan(text: product.condition, style: Theme.of(context).textTheme.bodyLarge),
                    TextSpan(text: ' Size ', style: Theme.of(context).textTheme.bodySmall),
                    TextSpan(text: product.size, style: Theme.of(context).textTheme.bodyLarge),
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