import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vintaged/features/shop/screens/payment/payment.dart';
import 'package:vintaged/features/shop/screens/product_details/widgets/make_offer.dart';
import 'package:vintaged/utils/constants/sizes.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../personalization/screens/widgets/profile_menu_detail.dart';

class VBottomButtons extends StatelessWidget {
  const VBottomButtons({
    super.key,
    required this.color,
    required this.borderColor
  });

  final Color color;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: VSizes.defaultSpace, vertical: VSizes.defaultSpace / 2),
      decoration: BoxDecoration(
        color: color,
        border: Border(
          top: BorderSide(
            color: borderColor,
            width: 2,
          )
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3),
              child: ElevatedButton(
                onPressed: () => Get.to(() => const VMakeOffer(data: 'Make an offer',)),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(VSizes.md),
                  backgroundColor: VColors.white,
                  foregroundColor: VColors.dark
                ),
                child: const Text('Make Offer'),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3),
              child: ElevatedButton(
                onPressed: () => Get.to(() => const PaymentScreen()),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(VSizes.md),
                ),
                child: const Text('Buy')
              ),
            ),
          )
        ],
      ),
    );
  }
}