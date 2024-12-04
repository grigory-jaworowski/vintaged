import 'package:flutter/material.dart';
import '../../constants/colors.dart';

class VChipTheme {
  VChipTheme._();

  static ChipThemeData vintagedChipTheme = ChipThemeData(
    disabledColor: VColors.grey.withOpacity(0.4),
    labelStyle: const TextStyle(color: VColors.black),
    selectedColor: VColors.primary,
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    checkmarkColor: VColors.white,
  );
}
