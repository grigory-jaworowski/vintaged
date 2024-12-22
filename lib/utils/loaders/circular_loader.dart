import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class VCircularLoader extends StatelessWidget {
  const VCircularLoader({
    super.key,
    this.foregroundColor = VColors.white,
    this.backgroundColor = VColors.primary,
  });

  final Color? foregroundColor;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(VSizes.lg),
      decoration: BoxDecoration(color: backgroundColor, shape: BoxShape.circle), // Circular background
      child: Center(
        child: CircularProgressIndicator(color: foregroundColor, backgroundColor: Colors.transparent), // Circular loader
      ),
    );
  }
}