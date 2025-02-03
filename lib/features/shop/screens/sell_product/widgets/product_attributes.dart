import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:vintaged/utils/constants/colors.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/validators/validators.dart';
import '../../../controllers/sell_product/sell_product_controller.dart';

class VSellProductAttributes extends StatelessWidget {
  const VSellProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = SellProductController.instance;
    return Form(
      key: controller.attributesFormKey,
      child: Column(
        children: [
          TextFormField(
            controller: controller.brand,
            validator: (value) => Validator.validateEmptyText('Brand', value),
            expands: false,
            decoration: const InputDecoration(labelText: 'Brand'),
          ),
          const SizedBox(height: VSizes.spaceBtwInputFields),
          TextFormField(
            controller: controller.size,
            validator: (value) => Validator.validateEmptyText('Size', value),
            expands: false,
            decoration: const InputDecoration(labelText: 'Size'),
          ),
          const SizedBox(height: VSizes.spaceBtwInputFields),
          Obx(
            () => DropdownButtonFormField(
              validator: (value) => Validator.validateCondition('condition', value),
              decoration: const InputDecoration(labelText: 'Condition'),
              value: controller.selectedCondition.value,
              onChanged: (value) {
                controller.selectedCondition.value = value;
              },
              items: ['Brand new', 'Very good', 'Good', 'Satisfactory']
                  .map((category) =>
                      DropdownMenuItem(value: category, child: Text(category)))
                  .toList(),
            ),
          ),
          const SizedBox(height: VSizes.spaceBtwInputFields),
          TextFormField(
            controller: controller.weight,
            decoration: const InputDecoration(
                labelText: 'Weight',
                hintText:
                    'Enter weight (max 3 decimals) for precise CO₂ calculation',
                hintStyle: TextStyle(color: VColors.grey, fontSize: 12)),
            validator: (value) => Validator.validateEmptyText('Weight', value),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,3}$')),
            ],
          ),
          const SizedBox(height: VSizes.spaceBtwInputFields),
          TextFormField(
            controller: controller.price,
            decoration: const InputDecoration(
                labelText: 'Price',
                hintText:
                    'Price with up-to 2 decimals',
                hintStyle: TextStyle(color: VColors.grey)),
            validator: (value) => Validator.validateEmptyText('Price', value),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}$')),
            ],
          ),
        ],
      ),
    );
  }
}
