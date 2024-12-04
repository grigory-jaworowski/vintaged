import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:vintaged/common/styles/spacing_styles.dart';
import 'package:vintaged/common/widgets/login_signup/form_divider.dart';
import 'package:vintaged/common/widgets/login_signup/social_buttons.dart';
import 'package:vintaged/features/authentication/screens/password_config/password_config.dart';
import 'package:vintaged/features/authentication/screens/signup/signup.dart';
import 'package:vintaged/home_menu.dart';
import 'package:vintaged/utils/constants/image_strings.dart';
import 'package:vintaged/utils/constants/sizes.dart';
import 'package:vintaged/utils/constants/text_strings.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: VSpacingStyles.paddingWidthAppBarHeight,
          child: Column(
            children: [
              ///Logo, Title & Sub-Title
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                  const Image(
                    height: 150,
                    image: AssetImage(VImages.testAppLogo),
                  ),
                  Text(VTexts.loginTitle, style: Theme.of(context).textTheme.headlineMedium),
                  const SizedBox(height: VSizes.sm),
                  Text(VTexts.loginSubTitle, style: Theme.of(context).textTheme.bodyMedium),
                 ],
              ),
              // Form
              Form(child: Padding(
                padding: const EdgeInsets.symmetric(vertical: VSizes.spaceBtwSections),
                child: Column(
                  children: [
                    //Email
                    TextFormField(
                      decoration: const InputDecoration(prefixIcon: Icon(Iconsax.direct_right), labelText: VTexts.email),
                    ),
                    const SizedBox(height: VSizes.spaceBtwInputFields),
                
                    //Password
                    TextFormField(
                      decoration: const InputDecoration(prefixIcon: Icon(Iconsax.password_check), labelText: VTexts.password, suffixIcon: Icon(Iconsax.eye_slash)),
                    ),
                    const SizedBox(height: VSizes.spaceBtwInputFields/2),
                
                    //Remember Me & Forget Password
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Remember Me
                        Row(
                          children: [
                            Checkbox(value: true, onChanged: (value){}),
                            const Text(VTexts.rememberMe),
                          ],
                        ),
                        // Forget Password
                        TextButton(onPressed: () => Get.to(() => const ForgetPassword()), child: const Text(VTexts.forgetPassword)),
                      ],
                    ),
                    const SizedBox(height: VSizes.spaceBtwSections),
                
                    //Sign In Button
                    SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => Get.to(() => const HomeMenu()), child: const Text(VTexts.signIn))),
                    const SizedBox(height: VSizes.spaceBtwItems),
                
                    //Create Account Button
                    SizedBox(width: double.infinity, child: OutlinedButton(onPressed: () => Get.to(() => const SignUpScreen()), child: const Text(VTexts.createAccount))),
                    const SizedBox(height: VSizes.spaceBtwSections),
                  ],
                ),
              )),
              
              // Divider
              const VFormDivider(dividerText: VTexts.orSignInWith),
              const SizedBox(height: VSizes.spaceBtwSections),

              // Footer
              const VSocialButtons(),
            ],
          ),),
      ),
    );
  }
}