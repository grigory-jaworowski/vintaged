import 'package:flutter/material.dart';
import 'package:vintaged/utils/constants/colors.dart';
import 'package:vintaged/utils/constants/image_strings.dart';
import 'package:vintaged/utils/constants/sizes.dart';

class VSocialButtons extends StatelessWidget {
  const VSocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(border: Border.all(color: VColors.grey), borderRadius: BorderRadius.circular(100)),
          child: IconButton(
            onPressed: (){},
            icon: const Image(
              width: VSizes.iconMd,
              height: VSizes.iconMd,
              image: AssetImage(VImages.googleIcon))),
        ),
        const SizedBox(width: VSizes.spaceBtwItems),
        Container(
          decoration: BoxDecoration(border: Border.all(color: VColors.grey), borderRadius: BorderRadius.circular(100)),
          child: IconButton(
            onPressed: (){},
            icon: const Image(
              width: VSizes.iconMd,
              height: VSizes.iconMd,
              image: AssetImage(VImages.facebookIcon))),
        ),
      ],
    );
  }
}