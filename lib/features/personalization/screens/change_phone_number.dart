import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../common/widgets/appbar/appbar.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/validators/validators.dart';
import '../controllers/change_phone_number_controller.dart';

class ChangePhoneNumber extends StatelessWidget {
  const ChangePhoneNumber ({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdatePhoneController());
    return Scaffold(
      appBar: VAppBar(showBackArrow: true, title: Text('Phone number', style: Theme.of(context).textTheme.headlineSmall)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(VSizes.defaultSpace),
          child: Form(
            key: controller.updatePhoneController,
            child: Column(
              children: [
                TextFormField(
                  controller: controller.phoneNumber,
                  validator: (value) => Validator.validateEmptyText('Phone number', value),
                  decoration: const InputDecoration(
                    labelText: 'Phone number',
                    prefixIcon: Icon(Iconsax.edit)
                  )
                ),
                const SizedBox(height: VSizes.spaceBtwSections),
                SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => controller.updatePhone(), child: const Text('Save'))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}