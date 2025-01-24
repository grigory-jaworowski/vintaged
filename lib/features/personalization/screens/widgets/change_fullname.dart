import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:vintaged/features/personalization/controllers/update_name_controller.dart';
import 'package:vintaged/utils/validators/validators.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../utils/constants/sizes.dart';

class ChangeFullname extends StatelessWidget {
  const ChangeFullname({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());
    return Scaffold(
      appBar: VAppBar(showBackArrow: true, title: Text('Change Name', style: Theme.of(context).textTheme.headlineSmall)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(VSizes.defaultSpace),
          child: Form(
            key: controller.updateNameController,
            child: Column(
              children: [
                TextFormField(
                  controller: controller.firstName,
                  validator: (value) => Validator.validateEmptyText('First name', value),
                  decoration: const InputDecoration(
                    labelText: 'First Name',
                    prefixIcon: Icon(Iconsax.edit)
                  )
                ),
                const SizedBox(height: VSizes.spaceBtwItems),
                TextFormField(
                  controller: controller.lastName,
                  validator: (value) => Validator.validateEmptyText('First name', value),
                  decoration: const InputDecoration(
                    labelText: 'Last Name',
                    prefixIcon: Icon(Iconsax.edit)
                  )
                ),
                const SizedBox(height: VSizes.spaceBtwItems),
                SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => controller.updateUserName(), child: const Text('Save'))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}