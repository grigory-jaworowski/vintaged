import 'package:flutter/material.dart';
import 'package:vintaged/common/styles/spacing_styles.dart';
import 'package:vintaged/utils/constants/sizes.dart';
import 'package:vintaged/utils/constants/text_strings.dart';
import 'package:vintaged/utils/helpers/helper_functions.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key, required this.image, required this.title, required this.subtitle, this.onPressed});

  final String image, title, subtitle;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: VSpacingStyles.paddingWidthAppBarHeight *2,
          child: Column(
            children: [
              // Image
              Image( image: AssetImage(image), width: VHelperFunctions.screenWidth() * 0.6),
              const SizedBox(height: VSizes.spaceBtwSections),

              // Title & Subtitle
              Text(title, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),
              const SizedBox(height: VSizes.spaceBtwItems),
              Text(subtitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center),
              const SizedBox(height: VSizes.spaceBtwSections),

              // Buttons
              SizedBox(width: double.infinity, child: ElevatedButton(onPressed: onPressed, child: const Text(VTexts.vContinue)))
            ],
          ),
        ),
      ),
    );
  }
}