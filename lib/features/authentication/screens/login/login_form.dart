import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:vintaged/common/styles/spacing_styles.dart';
import 'package:vintaged/features/authentication/controllers/login/login_controller.dart';
import 'package:vintaged/features/authentication/screens/password_config/forget_password.dart';
import 'package:vintaged/features/authentication/screens/signup/signup.dart';
import 'package:vintaged/utils/constants/image_strings.dart';
import 'package:vintaged/utils/constants/sizes.dart';
import 'package:vintaged/utils/constants/text_strings.dart';
import 'package:vintaged/utils/validators/validators.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

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
              Form(
                key: controller.loginFormKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: VSizes.spaceBtwSections),
                  child: Column(
                    children: [
                      //Email
                      TextFormField(
                        controller: controller.email,
                        validator: (value) => Validator.validateEmail(value),
                        decoration: const InputDecoration(prefixIcon: Icon(Iconsax.direct_right), labelText: VTexts.email),
                      ),
                      const SizedBox(height: VSizes.spaceBtwInputFields),
                  
                      //Password
                      Obx(
                        () => TextFormField(
                          validator: (value) => Validator.validateEmptyText('Password', value),
                          controller: controller.password,
                          obscureText: controller.hidePassword.value,
                          expands: false,
                          decoration: InputDecoration(
                            labelText: VTexts.password,
                            prefixIcon: const Icon(Iconsax.call),
                            suffixIcon: IconButton(
                              onPressed: () => controller.hidePassword.value = !controller.hidePassword.value,
                              icon: Icon(controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye)
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: VSizes.spaceBtwInputFields/2),
                  
                      //Remember Me & Forget Password
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Remember Me
                          Row(
                            children: [
                              Obx(
                                () => Checkbox(
                                  value: controller.rememberMe.value,
                                  onChanged: (value) => controller.rememberMe.value = !controller.rememberMe.value
                                ),
                              ),
                              const Text(VTexts.rememberMe),
                            ],
                          ),
                          // Forget Password
                          TextButton(onPressed: () => Get.to(() => const ForgetPasswordScreen()), child: const Text(VTexts.forgetPassword)),
                        ],
                      ),
                      const SizedBox(height: VSizes.spaceBtwSections),
                  
                      //Sign In Button
                      SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => controller.emailAndPasswordSignIn(), child: const Text(VTexts.signIn))),
                      const SizedBox(height: VSizes.spaceBtwItems),
                  
                      //Create Account Button
                      SizedBox(width: double.infinity, child: OutlinedButton(onPressed: () => Get.to(() => const SignUpScreen()), child: const Text(VTexts.createAccount))),
                      const SizedBox(height: VSizes.spaceBtwSections),
                    ],
                  ),
              )),
              
              /*
              // Divider
              const VFormDivider(dividerText: VTexts.orSignInWith),
              const SizedBox(height: VSizes.spaceBtwSections),

              // Footer
              const VSocialButtons(),
              */
            ],
          ),),
      ),
    );
  }
}