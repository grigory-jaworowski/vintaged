import 'dart:io';

import 'package:flutter/material.dart';
import 'package:vintaged/utils/constants/sizes.dart';

class VRoundedImage extends StatelessWidget {
  const VRoundedImage({
    super.key,
    this.width,
    this.height,
    this.border,
    this.padding,
    this.onTap,
    this.imageFile,
    this.image,
    this.fit = BoxFit.cover,
    this.isNetworkImage = false,
    this.isFileImage = false,
    this.applyImageRadius = true,
    this.borderRadius = VSizes.md,
  });

  final double? width, height;
  final String? image;
  final bool applyImageRadius;
  final BoxBorder? border;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final bool isFileImage;
  final VoidCallback? onTap;
  final double borderRadius;
  final File? imageFile;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
          border: border,
          color: Colors.white,
          borderRadius: BorderRadius.circular(borderRadius)
        ),
        child: ClipRRect(
          borderRadius: applyImageRadius ? BorderRadius.circular(borderRadius) : BorderRadius.zero,
          child: isFileImage ? Image.file(imageFile!, fit: fit,) : Image(fit: fit, image: isNetworkImage ? NetworkImage(image!) : AssetImage(image!))
        ),
      ),
    );
  }
}