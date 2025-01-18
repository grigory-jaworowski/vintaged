import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:vintaged/common/widgets/appbar/appbar.dart';
import 'package:vintaged/utils/constants/sizes.dart';

class VProfileMenuDetail extends StatelessWidget {
  const VProfileMenuDetail({
    super.key,
    required this.data
  });

  final String data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VAppBar(showBackArrow: true, title: Text('New $data')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(VSizes.defaultSpace),
          child: Form(
            child: Column(
              children: [
                TextFormField(decoration: InputDecoration(labelText: data, prefixIcon: const Icon(Iconsax.edit))),
                const SizedBox(height: VSizes.spaceBtwItems),
                SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () {}, child: const Text('Save'))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}