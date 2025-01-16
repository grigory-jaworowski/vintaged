import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/custom_shapes/curved_edges/curved_edges_widgets.dart';
import '../../../../../common/widgets/icons/circular_icon.dart';
import '../../../../../common/widgets/image_widgets/rounded_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class VProductImageSlider extends StatelessWidget {
  const VProductImageSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return VCurvedEdgeWidget(
      child: Container(
        color: VColors.light,
        child: Stack(
          children: [
            // Main large image
            const SizedBox(
              height: 450,
              child: Padding(
                padding: EdgeInsets.all(VSizes.productImageRadius * 2),
                child: Center(child: Image(image: AssetImage(VImages.productImage1))),
              )
            ),
    
            // Image slider
            Positioned(
              right: 0,
              bottom: 30,
              left: VSizes.defaultSpace ,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  separatorBuilder: (_, __) => const SizedBox(width: VSizes.spaceBtwItems),
                  itemCount: 6,
                  itemBuilder: (_, index) => VRoundedImage(
                    width: 80,
                    border: Border.all(color: VColors.primary),
                    padding: const EdgeInsets.all(VSizes.sm),
                    image: VImages.productImage2,
                  ),
                ),
              ),
            ),
            // Appbar
            const VAppBar(
              showBackArrow: true,
              actions: [
                VCircularIcon(icon: Iconsax.heart5, color: VColors.red)
              ],
            )
          ],
        ),
      ),
    );
  }
}