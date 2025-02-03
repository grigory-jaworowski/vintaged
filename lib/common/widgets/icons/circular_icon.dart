import 'package:flutter/material.dart';

class VCircularIcon extends StatelessWidget {
  const VCircularIcon({super.key,
  this.width,
  this.height,
  this.size,
  this.padding,
  required this.icon,
  this.color,
  this.backgroundColor,
  this.onPressed
  });

  final double? width, height, size;
  final EdgeInsetsGeometry? padding;
  final IconData icon;
  final Color? color, backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor?.withOpacity(0.7),
        borderRadius: BorderRadius.circular(100)
      ),
      child: IconButton(onPressed: onPressed, padding: padding, icon: Icon(icon, color: color, size: size)),
    );
  }
}