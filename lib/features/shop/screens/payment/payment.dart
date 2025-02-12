import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vintaged/common/widgets/appbar/appbar.dart';
import 'package:vintaged/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:vintaged/utils/constants/colors.dart';
import 'package:vintaged/utils/constants/sizes.dart';

import '../../../../common/widgets/products/purchase_item/purchase_item.dart';
import '../../../../utils/popups/loaders.dart';
import '../../../personalization/controllers/user_controller.dart';
import '../../../personalization/screens/add_new_address.dart';
import '../../controllers/order_controller.dart';
import '../../models/product_model.dart';
import 'widgets/billing_amount_section.dart';
import 'widgets/billing_payment_section.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final userController = UserController.instance;
    final orderController = Get.put(OrderController());
    return Scaffold(
      appBar: VAppBar(
          showBackArrow: true,
          title: Text('Payment',
              style: Theme.of(context).textTheme.headlineSmall)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(VSizes.defaultSpace),
          child: Column(
            children: [
              VPurchaseItem(product: product),
              const SizedBox(height: VSizes.spaceBtwItems),
              VRoundedContainer(
                padding: const EdgeInsets.all(VSizes.md),
                borderColor: VColors.softGrey,
                child: Column(
                  children: [
                    // Pricing
                    VBillingAmountSection(product: product),
                    const SizedBox(height: VSizes.spaceBtwItems),

                    // Divider
                    const Divider(),
                    const SizedBox(height: VSizes.spaceBtwItems),

                    // Payment methods
                    VBillingPaymentSection(product: product),
                    const SizedBox(height: VSizes.spaceBtwItems),

                    // Payment address
                    Obx(() {
                      final user = userController.user.value;
                      final address = userController.user.value.address;

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Shipping Address',
                                  style:
                                      Theme.of(context).textTheme.headlineSmall,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis),
                              TextButton(
                                  onPressed: () =>
                                      Get.to(() => const AddNewAddressScreen()),
                                  child: const Text('Change/Add'))
                            ],
                          ),
                          const SizedBox(height: VSizes.spaceBtwItems / 2),
                          Text(user.fullName,
                              style: Theme.of(context).textTheme.bodyLarge),
                          Row(
                            children: [
                              const Icon(Icons.phone,
                                  color: Colors.grey, size: 16),
                              const SizedBox(width: VSizes.spaceBtwItems),
                              Text(user.phoneNumber,
                                  style:
                                      Theme.of(context).textTheme.bodyMedium),
                            ],
                          ),
                          const SizedBox(height: VSizes.spaceBtwItems / 2),
                          Row(
                            children: [
                              const Icon(Icons.location_on,
                                  color: Colors.grey, size: 16),
                              const SizedBox(width: VSizes.spaceBtwItems),
                              Expanded(
                                child: Text(
                                  address!.city.isNotEmpty
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
                    }),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(VSizes.defaultSpace),
        child: ElevatedButton(
          onPressed:
            userController.user.value.address!.city.isEmpty
                ? VLoaders.warningSnackBar(
                    title: 'Missing Address',
                    message: 'Please add a shipping address before proceeding.',
                  )
                : () => orderController.processOrder(product),
          
          child: const Text('Proceed'),
        ),
      ),
    );
  }
}
