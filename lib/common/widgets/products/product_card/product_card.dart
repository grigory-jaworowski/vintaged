import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:vintaged/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:vintaged/common/widgets/icons/circular_icon.dart';
import 'package:vintaged/common/widgets/image_widgets/rounded_image.dart';
import 'package:vintaged/common/widgets/texts/product_title_text.dart';
import 'package:vintaged/utils/constants/colors.dart';
import 'package:vintaged/utils/constants/image_strings.dart';
import 'package:vintaged/utils/constants/sizes.dart';

class VProductCard extends StatelessWidget {
  const VProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(VSizes.productImageRadius),
          color: Colors.white
        ),
        child:  Column(
          children: [
            const VRoundedContainer(
              height: 180,
              padding: EdgeInsets.all(1),
              child: Stack(
                children: [
                  // Thumbnail image
                  VRoundedImage(imageUrl: VImages.productImage2),
                  // Favorite icon button with counter
                  Positioned(
                    top: 0,
                    right: 0,
                    child: VCircularIcon(icon: Iconsax.heart5, color: VColors.red)
                  ),
                ],
              ),
            ),
      
            const SizedBox(height: VSizes.spaceBtwItems / 2),
      
            Padding(
              padding: const EdgeInsets.only(left: VSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const VProductTitleText(title: 'Chaqueta de cuero', smallSize: true),
                  const SizedBox(height: VSizes.spaceBtwItems / 2),
                  Row(
                    children: [
                      Text(
                        '40€',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.labelMedium,
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}