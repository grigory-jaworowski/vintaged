import 'package:flutter/material.dart';

import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class VBillingPaymentSection extends StatelessWidget {
  const VBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VSectionHeading(title: 'Payment Method', buttonTitle: 'Change', onPressed: () {}),
        const SizedBox(height: VSizes.spaceBtwItems / 2),
        Row(
          children: [
            const VRoundedContainer(
              width: 60,
              height: 40,
              backgroundColor: Colors.white,
              borderColor: Colors.white,
              padding: EdgeInsets.all(VSizes.sm),
              child: Image(image: AssetImage(VImages.creditCard), fit: BoxFit.contain),
            ),
            const SizedBox(width: VSizes.spaceBtwItems / 2),
            Text('Credit Card', style: Theme.of(context).textTheme.bodyLarge)
          ],
        ),
        
      ],
    );
  }
}