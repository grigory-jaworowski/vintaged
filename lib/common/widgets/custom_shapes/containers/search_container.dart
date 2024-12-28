import 'package:flutter/material.dart';
import 'package:vintaged/utils/constants/colors.dart';
import 'package:vintaged/utils/constants/sizes.dart';
import 'package:vintaged/utils/device/device_utility.dart';

class VSearchContainer extends StatelessWidget {
  const VSearchContainer({
    super.key, required this.text, this.icon, this.showBorder = true
  });

  final String text;
  final IconData? icon;
  final bool showBorder;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: VSizes.defaultSpace),
      child: Container(
        width: VDeviceUtils.getScreenWidth(context),
        padding: const EdgeInsets.all(VSizes.md),
        decoration: BoxDecoration(
          color: VColors.white,
          borderRadius: BorderRadius.circular(VSizes.cardRadiusLg),
          border: showBorder ? Border.all(color: VColors.grey) : null
        ),
        child: Row(
          children: [
            Icon(icon, color: VColors.darkerGrey),
            const SizedBox(width: VSizes.spaceBtwItems),
            Text(text, style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
      ),
    );
  }
}