import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vintaged/features/authentication/controllers/forget_password/forget_password_controller.dart';
import 'package:vintaged/features/authentication/screens/login/login_form.dart';
import 'package:vintaged/utils/constants/image_strings.dart';
import 'package:vintaged/utils/constants/sizes.dart';
import 'package:vintaged/utils/constants/text_strings.dart';
import 'package:vintaged/utils/helpers/helper_functions.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: () => Get.back(), icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(VSizes.defaultSpace),
          child: Column(
            children: [
              // Image
              Image( image: const AssetImage(VImages.testAppLogo), width: VHelperFunctions.screenWidth() * 0.6),
              const SizedBox(height: VSizes.spaceBtwSections),

              // Email, Title & Subtitle
              Text(email, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),
              const SizedBox(height: VSizes.spaceBtwItems),
              Text(VTexts.changeYourPasswordTitle, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),
              const SizedBox(height: VSizes.spaceBtwItems),
              Text(VTexts.changeYourPasswordSubTitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center),
              const SizedBox(height: VSizes.spaceBtwSections),

              // Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: (() => Get.offAll(() => const LoginScreen())),
                  child: const Text(VTexts.done)
                )
              ),
              const SizedBox(height: VSizes.spaceBtwItems),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: (() => ForgetPasswordController.instance.resendPasswordResetEmail(email)),
                  child: const Text(VTexts.resendEmail)
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}