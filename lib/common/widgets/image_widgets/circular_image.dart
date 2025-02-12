import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:vintaged/common/widgets/shimmers/shimmer_effect.dart';
import 'package:vintaged/utils/constants/colors.dart';

class VCircularImage extends StatelessWidget {
  const VCircularImage(
      {super.key,
      this.fit = BoxFit.cover,
      required this.image,
      this.isNetworkImage = false,
      this.overlayColor,
      this.backgroundColor,
      this.width = 50,
      this.height = 50,
      this.padding = 0,
      this.radius = 100});

  final BoxFit? fit;
  final String image;
  final bool isNetworkImage;
  final Color? overlayColor;
  final Color? backgroundColor;
  final double width, height, padding, radius;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(padding),
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: backgroundColor ?? VColors.white,
            shape: BoxShape.circle),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(radius),
          child: SizedBox(
              child: isNetworkImage
                  ? CachedNetworkImage(
                      fit: fit,
                      color: overlayColor,
                      imageUrl: image,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) =>
                              const VShimmerEffect(
                                  width: 55, height: 55, radius: 55),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    )
                  : Image(
                      fit: fit,
                      image: AssetImage(image),
                      color: overlayColor,
                    )),
        ));
  }
}
