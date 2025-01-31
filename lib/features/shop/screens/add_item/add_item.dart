import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/image_widgets/rounded_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../common/widgets/success_screen/success_screen.dart';
import '../../../../navigation_menu.dart';

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

            const SizedBox(height: VSizes.spaceBtwSections),
            
            TextFormField(
              expands: false,
              decoration: const InputDecoration(
                labelText: 'Title'
              ),
            ),

            const SizedBox(height: VSizes.spaceBtwInputFields),

            TextFormField(
              expands: false,
              minLines: 3,
              maxLines: 5,
              
              decoration: const InputDecoration(
                alignLabelWithHint: true,

                labelText: 'Description'
              ),
            ),

            const SizedBox(height: VSizes.spaceBtwInputFields),
            const Divider(thickness: 1, color: VColors.dark),
            const SizedBox(height: VSizes.spaceBtwInputFields),

            TextFormField(
              expands: false,
              decoration: const InputDecoration(
                labelText: 'Brand'
              ),
            ),

            const SizedBox(height: VSizes.spaceBtwInputFields),

            TextFormField(
              expands: false,
              decoration: const InputDecoration(
                labelText: 'Size'
              ),
            ),

            const SizedBox(height: VSizes.spaceBtwInputFields),

            TextFormField(
              expands: false,
              decoration: const InputDecoration(
                labelText: 'Condition'
              ),
            ),

            const SizedBox(height: VSizes.spaceBtwInputFields),
            const Divider(thickness: 1, color: VColors.dark),
            const SizedBox(height: VSizes.spaceBtwInputFields),

            DropdownButtonFormField(
              decoration:
                  const InputDecoration(labelText: 'Main Category'),
              onChanged: (value) {},
              items: ['Clothes', 'Shoes', 'Accessories']
                  .map((option) =>
                      DropdownMenuItem(value: option, child: Text(option)))
                  .toList(),
            ),

            const SizedBox(height: VSizes.spaceBtwInputFields),

            DropdownButtonFormField(
              decoration:
                  const InputDecoration(labelText: 'Sub-Category'),
              onChanged: (value) {},
              items: ['Clothes', 'Shoes', 'Accessories']
                  .map((option) =>
                      DropdownMenuItem(value: option, child: Text(option)))
                  .toList(),
            ),

            const SizedBox(height: VSizes.spaceBtwInputFields),
            const Divider(thickness: 1, color: VColors.dark),
            const SizedBox(height: VSizes.spaceBtwInputFields),

            TextFormField(
              expands: false,
              decoration: const InputDecoration(labelText: 'Price'),
            ),
            
            const SizedBox(height: VSizes.spaceBtwSections),
            

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
