import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:vintaged/utils/constants/colors.dart';

class VIconWithCounter extends StatelessWidget {
  const VIconWithCounter({
    super.key,
    required this.onPressed,
    this.iconColor = VColors.white,
    this.icon = Iconsax.notification,
  });

  final VoidCallback onPressed;
  final Color? iconColor;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(onPressed: onPressed, icon: Icon(icon, color: iconColor)),
        Positioned(
          right: 0,
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100)
            ),
            child: Center(
              child: Text('2', style: Theme.of(context).textTheme.labelLarge!.apply(color: VColors.white)),
            ),
          ),
        )
      ],
    );
  }
}