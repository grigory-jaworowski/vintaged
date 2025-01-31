import 'package:flutter/material.dart';
import 'package:vintaged/common/bindigs/general_bindings.dart';
import 'package:vintaged/routes/app_routes.dart';
import 'package:vintaged/utils/constants/colors.dart';
import 'package:vintaged/utils/theme/theme.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const  App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: VAppTheme.vintagedTheme,
      initialBinding: GeneralBindings(),
      getPages: AppRoutes.pages,
      home: const Scaffold(backgroundColor: VColors.primaryBackground, body: Center(child: CircularProgressIndicator(color: VColors.primary))),
    );
  }
}