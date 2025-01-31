import 'package:flutter/material.dart';
import 'package:vintaged/utils/constants/colors.dart';
import 'package:vintaged/utils/constants/sizes.dart';

class VRoundedContainer extends StatelessWidget {
  const VRoundedContainer({super.key,
  this.width,
  this.height,
  this.padding,
  this.margin,
  this.child,
  this.radius = VSizes.cardRadiusLg,
  this.backgroundColor = Colors.white,
  this.borderColor = VColors.borderPrimary,
  });

  final double? width, height;
  final EdgeInsetsGeometry? padding, margin;
  final Widget? child;
  final double radius;
  final Color backgroundColor, borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(color: borderColor, width: 1)
      ),
      child: child,
    );
  }
}