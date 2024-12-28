import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:vintaged/common/widgets/login_signup/terms_conditions.dart';
import 'package:vintaged/features/authentication/controllers/signup/signup_controller.dart';
import 'package:vintaged/utils/constants/sizes.dart';
import 'package:vintaged/utils/constants/text_strings.dart';
import 'package:vintaged/utils/validators/validators.dart';

class VSignUpForm extends StatelessWidget {
  const VSignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    
    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [
          // Name & Surname
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  validator: (value) => Validator.validateEmptyText('First Name', value),
                  controller: controller.firstName,
                  expands: false,
                  decoration: const InputDecoration(labelText: VTexts.firstName, prefixIcon: Icon(Iconsax.user)),
                ),
              ),
              const SizedBox(width: VSizes.spaceBtwInputFields),
              Expanded(
                child: TextFormField(
                  validator: (value) => Validator.validateEmptyText('Last Name', value),
                  controller: controller.lastName,
                  expands: false,
                  decoration: const InputDecoration(labelText: VTexts.lastName, prefixIcon: Icon(Iconsax.user)),
                ),
              ),
            ],
          ),
          const SizedBox(height: VSizes.spaceBtwInputFields),
    
          // Username
          TextFormField(
            validator: (value) => Validator.validateEmptyText('Username', value),
            controller: controller.username,
            expands: false,
            decoration: const InputDecoration(labelText: VTexts.username, prefixIcon: Icon(Iconsax.user_edit)),
          ),
          const SizedBox(height: VSizes.spaceBtwInputFields),
    
          // Email
          TextFormField(
            validator: (value) => Validator.validateEmail(value),
            controller: controller.email,
            expands: false,
            decoration: const InputDecoration(labelText: VTexts.email, prefixIcon: Icon(Iconsax.direct)),
          ),
          const SizedBox(height: VSizes.spaceBtwInputFields),
    
          // Phone number
          TextFormField(
            validator: (value) => Validator.validatePhoneNumber(value),
            controller: controller.phoneNumber,
            expands: false,
            decoration: const InputDecoration(labelText: VTexts.phoneNo, prefixIcon: Icon(Iconsax.call)),
          ),
          const SizedBox(height: VSizes.spaceBtwInputFields),
    
          // Password
          Obx(
            () => TextFormField(
              validator: (value) => Validator.validatePassword(value),
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
          const SizedBox(height: VSizes.spaceBtwInputFields),
    
          // Terms and Conditions Checkbox
          const VTermsAndConditionsCheckbox(),
          const SizedBox(height: VSizes.spaceBtwSections),
    
          // Create Account Button
          SizedBox(width: double.infinity,
          child: ElevatedButton(
            onPressed: () => controller.signup(),
            child: const Text(VTexts.createAccount))),
          const SizedBox(height: VSizes.spaceBtwSections),

          /*
          // Divider
          const VFormDivider(dividerText: VTexts.orSignInWith),
          const SizedBox(height: VSizes.spaceBtwSections),
          
          // Footer
          const VSocialButtons()
          */
        ],
      ),
    );
  }
}