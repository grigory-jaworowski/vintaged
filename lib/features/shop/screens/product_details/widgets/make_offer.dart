import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:vintaged/common/widgets/texts/section_heading.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/success_screen/success_screen.dart';
import '../../../../../navigation_menu.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/validators/validators.dart';

class VMakeOffer extends StatelessWidget {
  const VMakeOffer({super.key,
  required this.data
  });

  final String data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const VAppBar(showBackArrow: true, title: Text('Make on Offer')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(VSizes.defaultSpace),
          child: Form(
            child: Column(
              children: [
                const VSectionHeading(title: 'Please make a reasonable offer', showActionButton: false),
                const SizedBox(height: VSizes.spaceBtwItems),
                TextFormField(
                  validator: (value) => Validator.validateEmptyText('Amount', value),
                  decoration: InputDecoration(
                    labelText: data,
                    prefixIcon: const Icon(Iconsax.edit),
                    floatingLabelBehavior: FloatingLabelBehavior.never
                  ),
                ),
                const SizedBox(height: VSizes.spaceBtwItems),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Get.to(
                      () => SuccessScreen(
                        image: VImages.successfulPaymentIcon,
                        title: 'Offer Success!',
                        subtitle: 'User will be notified of your offer!',
                        onPressed: () => Get.offAll(() => const NavigationMenu()),
                      ),
                    ),
                  child: const Text('Offer'))
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}