import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/sizes.dart';

/// Custom Class Checkbox Themes
class VCheckboxTheme {
  VCheckboxTheme._(); // To avoid creating instances

  static CheckboxThemeData vintagedCheckboxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(VSizes.xs)),
    checkColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return VColors.white;
      } else {
        return VColors.black;
      }
    }),
    fillColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return VColors.primary;
      } else {
        return Colors.transparent;
      }
    }),
  );
}
