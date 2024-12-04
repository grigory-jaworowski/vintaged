import 'package:flutter/material.dart';
import 'package:vintaged/features/authentication/screens/login/login.dart';
import 'package:vintaged/utils/theme/theme.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const  App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: VAppTheme.vintagedTheme,
      home: const LoginScreen(),
    );
  }
}