import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/sizes.dart';

class VOutlinedButtonTheme {
  VOutlinedButtonTheme._();

  static final vintagedOutlinedButtonTheme  = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: VColors.dark,
      side: const BorderSide(color: VColors.primary),
      textStyle: const TextStyle(fontSize: 16, color: VColors.black, fontWeight: FontWeight.w600),
      padding: const EdgeInsets.symmetric(vertical: VSizes.buttonHeight, horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(VSizes.buttonRadius)),
    ),
  );
}
