import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/widgets/texts/section_heading.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
import '../models/payment_method_model.dart';
import '../screens/payment/widgets/payment_tile.dart';

class PaymentController extends GetxController {
  static PaymentController get instance => Get.find();

  final Rx<PaymentMethodModel> selectedPaymentMethod = PaymentMethodModel.empty().obs;

  @override
  void onInit() {
    selectedPaymentMethod.value = PaymentMethodModel(name: 'Paypal', image: VImages.paypal);
    super.onInit();
  }

  Future<dynamic> selectPaymentMethod(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (_) => SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(VSizes.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const VSectionHeading(title: 'Select Payment Method', showActionButton: false),
              const SizedBox(height: VSizes.spaceBtwSections),
              VPaymentTile(paymentMethod: PaymentMethodModel(name: 'Paypal', image: VImages.paypal)),
              const SizedBox(height: VSizes.spaceBtwItems / 2),
              VPaymentTile(paymentMethod: PaymentMethodModel(name: 'Credit Card', image: VImages.creditCard)),
              const SizedBox(height: VSizes.spaceBtwItems / 2),
              const SizedBox(height: VSizes.spaceBtwSections),
            ],
          ),
        ),
      ),
    );
  }
}