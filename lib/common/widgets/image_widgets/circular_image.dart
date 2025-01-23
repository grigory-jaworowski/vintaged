import 'package:flutter/widgets.dart';
import 'package:vintaged/utils/constants/colors.dart';

import '../../../utils/constants/sizes.dart';

class VCircularImage extends StatelessWidget {
  const VCircularImage({super.key,
  this.fit = BoxFit.cover,
  required this.image,
  this.isNetworkImage = false,
  this.overlayColor,
  this.backgroundColor,
  this.width = 50,
  this.height = 50,
  this.padding = VSizes.sm
  });

  final BoxFit? fit;
  final String image;
  final bool isNetworkImage;
  final Color? overlayColor;
  final Color? backgroundColor;
  final double width, height, padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: backgroundColor ?? VColors.white,
        borderRadius: BorderRadius.circular(100)
      ),
      child: Center(
        child: Image(
          fit: fit,
          image: isNetworkImage ? NetworkImage(image) : AssetImage(image),
          color: overlayColor,
        ),
      )
    );
  }
}