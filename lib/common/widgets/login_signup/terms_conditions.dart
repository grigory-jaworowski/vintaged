import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vintaged/features/authentication/controllers/signup/signup_controller.dart';
import 'package:vintaged/utils/constants/sizes.dart';
import 'package:vintaged/utils/constants/text_strings.dart';

class VTermsAndConditionsCheckbox extends StatelessWidget {
  const VTermsAndConditionsCheckbox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = SignupController.instance;
    return Row(
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Obx(
            () => Checkbox(
              value: controller.privacyPolicy.value,
              onChanged: (value) => controller.privacyPolicy.value = !controller.privacyPolicy.value
            ),
          ),
        ),
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
    );
  }
}