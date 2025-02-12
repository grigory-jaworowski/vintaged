import 'package:flutter/material.dart';
import 'package:vintaged/utils/constants/colors.dart';

class VShadowStyle {
  static final productShadow = BoxShadow(
    color: VColors.darkGrey.withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2)
  );
}