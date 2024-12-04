import 'package:flutter/material.dart';
import 'package:vintaged/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:vintaged/utils/constants/sizes.dart';
import 'package:vintaged/utils/constants/text_strings.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(VSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Title
              Text(VTexts.signupTitle, style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: VSizes.spaceBtwSections),

              //Form
              const VSignUpForm(),
            ],
          )
        )
      ),
    );
  }
}