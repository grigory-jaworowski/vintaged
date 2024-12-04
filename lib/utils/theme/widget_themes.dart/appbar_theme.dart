import 'package:flutter/material.dart';
import 'package:vintaged/utils/constants/sizes.dart';
import '../../constants/colors.dart';

class VAppBarTheme{
  VAppBarTheme._();

  static const vintagedAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: VColors.black, size: VSizes.iconMd),
    actionsIconTheme: IconThemeData(color: VColors.black, size: VSizes.iconMd),
    titleTextStyle: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600, color: VColors.black),
  );
}