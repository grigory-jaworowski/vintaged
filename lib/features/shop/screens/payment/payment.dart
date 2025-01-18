import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vintaged/common/widgets/appbar/appbar.dart';
import 'package:vintaged/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:vintaged/common/widgets/success_screen/success_screen.dart';
import 'package:vintaged/features/shop/screens/payment/widgets/billing_address_section.dart';
import 'package:vintaged/navigation_menu.dart';
import 'package:vintaged/utils/constants/colors.dart';
import 'package:vintaged/utils/constants/image_strings.dart';
import 'package:vintaged/utils/constants/sizes.dart';

import '../../../../common/widgets/products/purchase_item/purchase_item.dart';
import 'widgets/billing_amount_section.dart';
import 'widgets/billing_payment_section.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VAppBar(showBackArrow: true, title: Text('Payment', style: Theme.of(context).textTheme.headlineSmall)),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(VSizes.defaultSpace),
          child: Column(
            children: [
              VPurchaseItem(),
              SizedBox(height: VSizes.spaceBtwItems),           
              VRoundedContainer(
                padding: EdgeInsets.all(VSizes.md),
                borderColor: VColors.softGrey,
                child: Column(
                  children: [
                    // Pricing
                    VBillingAmountSection(),
                    SizedBox(height: VSizes.spaceBtwItems),

                    // Divider
                    Divider(),
                    SizedBox(height: VSizes.spaceBtwItems),

                    // Payment methods
                    VBillingPaymentSection(),
                    SizedBox(height: VSizes.spaceBtwItems),

                    // Payment address
                    VBillingAddressSection()
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
          onPressed: () => Get.to(
            () => SuccessScreen(
              image: VImages.successfulPaymentIcon,
              title: 'Payment Success!',
              subtitle: 'Your item will be shipped soon!',
              onPressed: () => Get.offAll(() => const NavigationMenu()),
            ),
          ),
          child: const Text('Proceed'),
        ),
      ),
    );
  }
}