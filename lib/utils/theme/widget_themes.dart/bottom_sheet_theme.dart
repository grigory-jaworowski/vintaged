import 'package:flutter/material.dart';
import 'package:vintaged/utils/constants/colors.dart';

class VBottomSheetTheme {
  VBottomSheetTheme._();

  static BottomSheetThemeData vintagedBottomSheetTheme = BottomSheetThemeData(
    showDragHandle: true,
    backgroundColor: VColors.white,
    modalBackgroundColor: VColors.white,
    constraints: const BoxConstraints(minWidth: double.infinity),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  );
}
