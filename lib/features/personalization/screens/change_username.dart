import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../common/widgets/appbar/appbar.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/validators/validators.dart';
import '../controllers/update_username_controller.dart';

class ChangeUsername extends StatelessWidget {
  const ChangeUsername({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateUsernameController());
    return Scaffold(
      appBar: VAppBar(showBackArrow: true, title: Text('Username', style: Theme.of(context).textTheme.headlineSmall)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(VSizes.defaultSpace),
          child: Form(
            key: controller.updateUsernameController,
            child: Column(
              children: [
                TextFormField(
                  controller: controller.username,
                  validator: (value) => Validator.validateEmptyText('Username', value),
                  decoration: const InputDecoration(
                    labelText: 'Username',
                    prefixIcon: Icon(Iconsax.edit)
                  )
                ),
                const SizedBox(height: VSizes.spaceBtwSections),
                SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => controller.updateUsername(), child: const Text('Save'))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}