import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../controllers/payment_controller.dart';
import '../../../models/product_model.dart';

class VBillingPaymentSection extends StatelessWidget {
  const VBillingPaymentSection({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final paymentController = Get.put(PaymentController());
    return Column(
      children: [
        VSectionHeading(
            title: 'Payment Method',
            buttonTitle: 'Change',
            onPressed: () {
              paymentController.selectPaymentMethod(context);
            }),
        const SizedBox(height: VSizes.spaceBtwItems / 2),
        Obx(
          () => Row(
            children: [
              VRoundedContainer(
                width: 60,
                height: 40,
                backgroundColor: Colors.white,
                borderColor: Colors.white,
                padding: const EdgeInsets.all(VSizes.sm),
                child: Image(image: AssetImage(paymentController.selectedPaymentMethod.value.image), fit: BoxFit.contain),
              ),
              const SizedBox(width: VSizes.spaceBtwItems / 2),
              Text(paymentController.selectedPaymentMethod.value.name.capitalize.toString(), style: Theme.of(context).textTheme.bodyLarge)
            ],
          ),
        ),
      ],
    );
  }
}
