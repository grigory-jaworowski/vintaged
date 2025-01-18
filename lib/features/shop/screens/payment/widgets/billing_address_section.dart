import 'package:flutter/material.dart';

import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constants/sizes.dart';

class VBillingAddressSection extends StatelessWidget {
  const VBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        VSectionHeading(title: 'Shipping Address', buttonTitle: 'Change', onPressed: () {}),
        const SizedBox(height: VSizes.spaceBtwItems / 2),
        Text('Grigory Volkov', style: Theme.of(context).textTheme.bodyLarge),
        Row(
          children: [
            const Icon(Icons.phone, color: Colors.grey, size: 16),
            const SizedBox(width: VSizes.spaceBtwItems),
            Text('+34633539705', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: VSizes.spaceBtwItems / 2),
        Row(
          children: [
            const Icon(Icons.location_history, color: Colors.grey, size: 16),
            const SizedBox(width: VSizes.spaceBtwItems),
            Expanded(child: Text('Benidorm, Avenida Doctor Severo Ochoa 29, Parcela 47', style: Theme.of(context).textTheme.bodyMedium, softWrap: true)),
          ],
        )
      ],
    );
  }
}