import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:vintaged/common/widgets/login_signup/form_divider.dart';
import 'package:vintaged/common/widgets/login_signup/social_buttons.dart';
import 'package:vintaged/features/authentication/screens/signup/verify_email.dart';
import 'package:vintaged/utils/constants/sizes.dart';
import 'package:vintaged/utils/constants/text_strings.dart';

class VSignUpForm extends StatelessWidget {
  const VSignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          // Name & Surname
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  expands: false,
                  decoration: const InputDecoration(labelText: VTexts.firstName, prefixIcon: Icon(Iconsax.user)),
                ),
              ),
              const SizedBox(width: VSizes.spaceBtwInputFields),
              Expanded(
                child: TextFormField(
                  expands: false,
                  decoration: const InputDecoration(labelText: VTexts.lastName, prefixIcon: Icon(Iconsax.user)),
                ),
              ),
            ],
          ),
          const SizedBox(height: VSizes.spaceBtwInputFields),
    
          //Username
          TextFormField(
            expands: false,
            decoration: const InputDecoration(labelText: VTexts.username, prefixIcon: Icon(Iconsax.user_edit)),
          ),
          const SizedBox(height: VSizes.spaceBtwInputFields),
    
          // Email
          TextFormField(
            expands: false,
            decoration: const InputDecoration(labelText: VTexts.email, prefixIcon: Icon(Iconsax.direct)),
          ),
          const SizedBox(height: VSizes.spaceBtwInputFields),
    
          // Phone number
          TextFormField(
            expands: false,
            decoration: const InputDecoration(labelText: VTexts.phoneNo, prefixIcon: Icon(Iconsax.call)),
          ),
          const SizedBox(height: VSizes.spaceBtwInputFields),
    
          // Password
          TextFormField(
            expands: false,
            decoration: const InputDecoration(labelText: VTexts.password,
            prefixIcon: Icon(Iconsax.call),
            suffixIcon: Icon(Iconsax.eye_slash)
            ),
          ),
          const SizedBox(height: VSizes.spaceBtwInputFields),
    
          // Terms and Conditions Checkbox
          Row(
            children: [
              SizedBox(width: 24, height: 24, child: Checkbox(value: false, onChanged: (value) {})),
              const SizedBox(width: VSizes.spaceBtwItems),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: '${VTexts.iAgreeTo} ', style: Theme.of(context).textTheme.bodySmall),
                    TextSpan(text: '${VTexts.privacyPolicy} ', style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.blue)),
                    TextSpan(text: '${VTexts.and} ', style: Theme.of(context).textTheme.bodySmall),
                    TextSpan(text: '${VTexts.termsOfUse} ', style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.blue)),
                  ]
                )
              )
            ],
          ),
          const SizedBox(height: VSizes.spaceBtwSections),
    
          // Create Account Button
          SizedBox(width: double.infinity,
          child: ElevatedButton(
            onPressed: () => Get.to(() => const VerifyEmailScreen()),
            child: const Text(VTexts.createAccount))),
          const SizedBox(height: VSizes.spaceBtwSections),
    
          // Divider
          const VFormDivider(dividerText: VTexts.orSignInWith),
          const SizedBox(height: VSizes.spaceBtwSections),
          
          // Footer
          const VSocialButtons()
        ],
      ),
    );
  }
}