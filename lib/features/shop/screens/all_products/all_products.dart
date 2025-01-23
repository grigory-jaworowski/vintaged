 import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:vintaged/common/widgets/appbar/appbar.dart';
import 'package:vintaged/common/widgets/layouts/grid_layout.dart';
import 'package:vintaged/common/widgets/products/product_card/product_card.dart';
import 'package:vintaged/utils/constants/sizes.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const VAppBar(title: Text('Products'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(VSizes.defaultSpace),
          child: Column(
            children: [
              DropdownButtonFormField(
                decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
                onChanged: (value) {},
                items: ['Name', 'Higher Price', 'Lower Price', 'Popularity']
                  .map((option) => DropdownMenuItem(value: option, child: Text(option)))
                  .toList(),
              ),
              const SizedBox(height: VSizes.spaceBtwSections),

              VGridLayout(itemCount: 4, itemBuilder: (_, index) => const VProductCard())
            ],
          ),
        ),
      ),
    );
  }
}