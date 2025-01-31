import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:vintaged/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:vintaged/common/widgets/icons/circular_icon.dart';
import 'package:vintaged/common/widgets/image_widgets/rounded_image.dart';
import 'package:vintaged/common/widgets/texts/product_title_text.dart';
import 'package:vintaged/features/shop/models/product_model.dart';
import 'package:vintaged/features/shop/screens/product_details/product_details.dart';
import 'package:vintaged/utils/constants/colors.dart';
import 'package:vintaged/utils/constants/image_strings.dart';
import 'package:vintaged/utils/constants/sizes.dart';

class VProductCard extends StatelessWidget {
  const VProductCard({super.key, required this.product});

  final ProductModel product;
  

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => ProductDetails(product: product)),
      child: Container(
        width: 180,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(VSizes.productImageRadius),
          color: Colors.white
        ),
        child:  Column(
          children: [
            VRoundedContainer(
              height: 190,
              padding: const EdgeInsets.all(0),
              child: Stack(
                children: [
                  // Thumbnail image
                  VRoundedImage(image: product.images[0], applyImageRadius: true, isNetworkImage: true),
                  // Favorite icon button with counter
                  const Positioned(
                    top: 0,
                    right: 0,
                    child: VCircularIcon(icon: Iconsax.heart5, color: VColors.red)
                  ),
                ],
              ),
            ),
      
            const SizedBox(height: VSizes.spaceBtwItems / 4),
      
            Padding(
              padding: const EdgeInsets.only(left: VSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  VProductTitleText(title: product.title, smallSize: true),
                  Row(
                    children: [
                      Text(
                        product.price.toString(),
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