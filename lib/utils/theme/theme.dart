import 'package:flutter/material.dart';
import 'package:vintaged/utils/theme/widget_themes.dart/appbar_theme.dart';
import 'package:vintaged/utils/theme/widget_themes.dart/bottom_sheet_theme.dart';
import 'package:vintaged/utils/theme/widget_themes.dart/checkbox_theme.dart';
import 'package:vintaged/utils/theme/widget_themes.dart/chip_theme.dart';
import 'package:vintaged/utils/theme/widget_themes.dart/elevated_button_theme.dart';
import 'package:vintaged/utils/theme/widget_themes.dart/outlined_button_theme.dart';
import 'package:vintaged/utils/theme/widget_themes.dart/text_field_theme.dart';
import 'package:vintaged/utils/theme/widget_themes.dart/text_theme.dart';
import 'package:vintaged/utils/constants/colors.dart';

class VAppTheme {
  VAppTheme._();

  static ThemeData vintagedTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    disabledColor: VColors.grey,
    brightness: Brightness.light,
    primaryColor: VColors.primary,
    textTheme: VTextTheme.vintagedTextTheme,
    chipTheme: VChipTheme.vintagedChipTheme,
    scaffoldBackgroundColor: VColors.white,
    appBarTheme: VAppBarTheme.vintagedAppBarTheme,
    checkboxTheme: VCheckboxTheme.vintagedCheckboxTheme,
    bottomSheetTheme: VBottomSheetTheme.vintagedBottomSheetTheme,
    elevatedButtonTheme: VElevatedButtonTheme.vintagedElevatedButtonTheme,
    outlinedButtonTheme: VOutlinedButtonTheme.vintagedOutlinedButtonTheme,
    inputDecorationTheme: VTextFormFieldTheme.vintagedInputDecorationTheme,
  );
}