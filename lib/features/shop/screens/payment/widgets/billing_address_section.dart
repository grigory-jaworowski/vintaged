import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vintaged/features/personalization/controllers/user_controller.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../personalization/screens/add_new_address.dart';

class VBillingAddressSection extends StatelessWidget {
  const VBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    final userController = UserController.instance;

    return Obx(() {
      final user = userController.user.value;
      final address = userController.user.value.address;

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Shipping Address',
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis),
                TextButton(onPressed: () => Get.to(() => const AddNewAddressScreen()), child: const Text('Change/Add'))
            ],
          ),
          const SizedBox(height: VSizes.spaceBtwItems / 2),
          Text(user.fullName, style: Theme.of(context).textTheme.bodyLarge),
          Row(
            children: [
              const Icon(Icons.phone, color: Colors.grey, size: 16),
              const SizedBox(width: VSizes.spaceBtwItems),
              Text(user.phoneNumber,
                  style: Theme.of(context).textTheme.bodyMedium),
            ],
          ),
          const SizedBox(height: VSizes.spaceBtwItems / 2),
          Row(
            children: [
              const Icon(Icons.location_on, color: Colors.grey, size: 16),
              const SizedBox(width: VSizes.spaceBtwItems),
              Expanded(
                child: Text(
                  address != null
                      ? '${address.street}, ${address.city}, ${address.province}, ${address.postalCode}, ${address.country}'
                      : 'No address added',
                  style: Theme.of(context).textTheme.bodyMedium,
                  softWrap: true,
                ),
              ),
            ],
          ),
        ],
      );
    });
  }
}
