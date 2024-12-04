import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/sizes.dart';

/* -- Outlined Button Themes -- */
class VOutlinedButtonTheme {
  VOutlinedButtonTheme._(); //To avoid creating instances

  static final vintagedOutlinedButtonTheme  = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: VColors.dark,
      side: const BorderSide(color: VColors.borderPrimary),
      textStyle: const TextStyle(fontSize: 16, color: VColors.black, fontWeight: FontWeight.w600),
      padding: const EdgeInsets.symmetric(vertical: VSizes.buttonHeight, horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(VSizes.buttonRadius)),
    ),
  );
}
