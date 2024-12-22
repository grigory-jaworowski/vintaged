import 'package:flutter/material.dart';
import 'package:vintaged/utils/constants/colors.dart';
import 'package:vintaged/utils/constants/sizes.dart';

class VElevatedButtonTheme {
  VElevatedButtonTheme._();

  static final vintagedElevatedButtonTheme  = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: VColors.light,
      backgroundColor: VColors.primary,
      disabledForegroundColor: VColors.darkGrey,
      disabledBackgroundColor: VColors.buttonDisabled,
      side: const BorderSide(color: VColors.primary),
      padding: const EdgeInsets.symmetric(vertical: VSizes.buttonHeight),
      textStyle: const TextStyle(fontSize: 16, color: VColors.textWhite, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(VSizes.buttonRadius)),
    ),
  );
}
