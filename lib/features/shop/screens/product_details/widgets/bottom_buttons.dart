import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vintaged/features/shop/screens/payment/payment.dart';
import 'package:vintaged/utils/constants/sizes.dart';

import '../../../models/product_model.dart';

class VBottomButtons extends StatelessWidget {
  const VBottomButtons(
      {super.key,
      required this.color,
      required this.borderColor,
      required this.product});

  final Color color;
  final Color borderColor;
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: VSizes.defaultSpace, vertical: VSizes.defaultSpace / 2),
      decoration: BoxDecoration(
        color: color,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3),
              child: ElevatedButton(
                  onPressed: () =>
                      Get.to(() => PaymentScreen(product: product)),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(VSizes.md),
                  ),
                  child: const Text('Buy')),
            ),
          )
        ],
      ),
    );
  }
}
