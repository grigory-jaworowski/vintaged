import 'package:flutter/material.dart';
import 'package:vintaged/common/widgets/image_widgets/circular_image.dart';
import 'package:vintaged/utils/constants/colors.dart';
import 'package:vintaged/utils/constants/sizes.dart';

class VerticalImageText extends StatelessWidget {
  const VerticalImageText({
    super.key,
    required this.image,
    required this.title,
    this.textColor = VColors.white,
    this.backgroundColor = VColors.white,
    this.onTap,
    this.isNetworkImage = true,
  });

  final String image, title;
  final bool isNetworkImage;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onTap;
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: VSizes.spaceBtwItems),
        child: Column(
          children: [
            // Circular icon
            VCircularImage(
              radius: 0,
              padding: VSizes.sm,
              width: 56,
              height: 56,
              image: image,
              isNetworkImage: isNetworkImage,
              backgroundColor: backgroundColor,
            ),
          
            // Text
            const SizedBox(height: VSizes.spaceBtwItems / 2),
            SizedBox(
              width: 55,
              child: Text(
                title,
                style: Theme.of(context).textTheme.labelMedium!.apply(color: textColor),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
    );
  }
}