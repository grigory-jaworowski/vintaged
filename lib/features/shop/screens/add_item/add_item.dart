import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/custom_shapes/curved_edges/curved_edges_widgets.dart';
import '../../../../../common/widgets/icons/circular_icon.dart';
import '../../../../../common/widgets/image_widgets/rounded_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../common/widgets/success_screen/success_screen.dart';
import '../../../../navigation_menu.dart';
import '../../../../utils/constants/text_strings.dart';

class AddItem extends StatelessWidget {
  const AddItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const VAppBar(title: Text('Sell an Item')),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(VSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 80,
              child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                physics: const AlwaysScrollableScrollPhysics(),
                separatorBuilder: (_, __) =>
                    const SizedBox(width: VSizes.spaceBtwItems),
                itemCount: 0,
                itemBuilder: (_, index) => VRoundedImage(
                  width: 80,
                  border: Border.all(color: VColors.dark),
                  padding: const EdgeInsets.all(VSizes.sm),
                  image: VImages.productImage1,
                ),
              ),
            ),
            
            const SizedBox(height: VSizes.spaceBtwItems),

            Center(
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(
                      color: VColors.dark), // Set the border color
                ),
                child: const Text(
                  'Upload photos',
                  style: TextStyle(color: VColors.dark), // Set the text color
                ),
              ),
            ),

            const SizedBox(height: VSizes.spaceBtwInputFields),
            const Divider(thickness: 1, color: VColors.dark),
            const SizedBox(height: VSizes.spaceBtwInputFields),
            
            const Text('Title'),
            TextFormField(
              expands: false,
              decoration: const InputDecoration(),
            ),

            const SizedBox(height: VSizes.spaceBtwInputFields),

            const Text('Description'),
            TextFormField(
              expands: false,
              decoration: const InputDecoration(),
            ),

            const SizedBox(height: VSizes.spaceBtwInputFields),
            const Divider(thickness: 1, color: VColors.dark),
            const SizedBox(height: VSizes.spaceBtwInputFields),

            DropdownButtonFormField(
              decoration:
                  const InputDecoration(hintText: 'Choose main category'),
              onChanged: (value) {},
              items: ['Clothes', 'Shoes', 'Accessories']
                  .map((option) =>
                      DropdownMenuItem(value: option, child: Text(option)))
                  .toList(),
            ),

            const SizedBox(height: VSizes.spaceBtwInputFields),

            DropdownButtonFormField(
              decoration:
                  const InputDecoration(hintText: 'Choose sub-category'),
              onChanged: (value) {},
              items: ['Clothes', 'Shoes', 'Accessories']
                  .map((option) =>
                      DropdownMenuItem(value: option, child: Text(option)))
                  .toList(),
            ),

            const SizedBox(height: VSizes.spaceBtwInputFields),
            const Divider(thickness: 1, color: VColors.dark),
            const SizedBox(height: VSizes.spaceBtwInputFields),

            const Text('Price'),
            TextFormField(
              expands: false,
              decoration: const InputDecoration(),
            ),
            
            const SizedBox(height: VSizes.spaceBtwInputFields),
            const Divider(thickness: 1, color: VColors.dark),
            const SizedBox(height: VSizes.spaceBtwInputFields),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => Get.to(
                    () => SuccessScreen(
                      image: VImages.successfulPaymentIcon,
                      title: 'Item Added!',
                      subtitle: 'Item is now on the market!',
                      onPressed: () => Get.offAll(() => const NavigationMenu()),
                    ),
                  ),
                  child: const Text(
                    'Upload',
                    style: TextStyle(color: VColors.white), // Set the text color
                  ),
                ),
            ),
          ],
        ),
      )),
    );
  }
}
