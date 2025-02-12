import 'package:flutter/material.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/validators/validators.dart';
import '../../../controllers/sell_product_controller.dart';

class VSellProductTitleDescription extends StatelessWidget {
  const VSellProductTitleDescription({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = SellProductController.instance;
    return Form(
      key: controller.titleDescriptionFormKey,
      child: Column(
        children: [
          TextFormField(
            controller: controller.title,
            validator: (value) => Validator.validateEmptyText('Item Title', value),
            expands: false,
            decoration: const InputDecoration(labelText: 'Title'),
          ),
          const SizedBox(height: VSizes.spaceBtwInputFields),
          TextFormField(
            expands: false,
            minLines: 3,
            maxLines: 5,
            controller: controller.description,
            validator: (value) => Validator.validateEmptyText('Description', value),
            decoration: const InputDecoration(
                alignLabelWithHint: true, labelText: 'Description'),
          ),
        ],
      ),
    );
  }
}