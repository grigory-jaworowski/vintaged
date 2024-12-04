import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:vintaged/features/authentication/screens/password_config/reset_password.dart';
import 'package:vintaged/utils/constants/sizes.dart';
import 'package:vintaged/utils/constants/text_strings.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(VSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Headings
            Text(VTexts.forgetPasswordTitle, style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: VSizes.spaceBtwItems),
            Text(VTexts.forgetPasswordSubTitle, style: Theme.of(context).textTheme.labelMedium),
            const SizedBox(height: VSizes.spaceBtwSections * 2),

            // Text field
            TextFormField(
              decoration: const InputDecoration(labelText: VTexts.email, prefixIcon: Icon(Iconsax.direct_right)),
            ),
            const SizedBox(height: VSizes.spaceBtwSections),

            // Submit Button
            SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () =>  Get.to(() => const ResetPassword()), child: const Text(VTexts.submit)))
          ],
        ),
      ),
    );
  }
}