import 'package:flutter/material.dart';
import 'package:vintaged/utils/constants/colors.dart';
import 'package:vintaged/utils/constants/sizes.dart';

class VTextFormFieldTheme {
  VTextFormFieldTheme._();

  static InputDecorationTheme vintagedInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: VColors.darkGrey,
    suffixIconColor: VColors.darkGrey,
    
    labelStyle: const TextStyle().copyWith(fontSize: VSizes.fontSizeMd, color: VColors.black),
    hintStyle: const TextStyle().copyWith(fontSize: VSizes.fontSizeSm, color: VColors.black),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle: const TextStyle().copyWith(color: VColors.black.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(VSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: VColors.grey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(VSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: VColors.grey),
    ),
    focusedBorder:const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(VSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: VColors.dark),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(VSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: VColors.warning),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(VSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 2, color: VColors.warning),
    ),
  );
}
