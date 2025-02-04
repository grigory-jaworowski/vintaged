import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/image_widgets/rounded_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../common/widgets/icons/circular_icon.dart';
import '../../../../common/widgets/success_screen/success_screen.dart';
import '../../../../navigation_menu.dart';
import '../../controllers/product/product_images_controller.dart';
import '../../controllers/sell_product/sell_product_controller.dart';
import 'widgets/category_buttons.dart';
import 'widgets/product_attributes.dart';
import 'widgets/title_description.dart';

class SellProduct extends StatelessWidget {
  const SellProduct({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final imagesController = Get.put(ProductImagesController());
    final sellProductController = Get.put(SellProductController());
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
              child: Obx(
                () => imagesController.productImages.isEmpty
                    ? const VRoundedImage(
                        width: 80,
                        image:
                            VImages.emptyImage, // Show placeholder if no images
                      )
                    : ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        physics: const AlwaysScrollableScrollPhysics(),
                        separatorBuilder: (_, __) =>
                            const SizedBox(width: VSizes.spaceBtwItems),
                        itemCount: imagesController.productImages.length,
                        itemBuilder: (_, index) {
                          final image = imagesController.productImages[index];

                          return Stack(
                            children: [
                              VRoundedImage(
                                isFileImage: true,
                                width: 80,
                                imageFile: File(image.path),
                              ),
                              Positioned(
                                  right: 0,
                                  child: VCircularIcon(
                                    icon: Iconsax.trash,
                                    color: VColors.dark,
                                    backgroundColor: VColors.grey,
                                    width: 30,
                                    height: 30,
                                    size: 20,
                                    padding: EdgeInsets.zero,
                                    onPressed: () =>
                                        imagesController.removeImage(image),
                                  )),
                            ],
                          );
                        }),
              ),
            ),
            const SizedBox(height: VSizes.spaceBtwInputFields),
            Center(
              child: OutlinedButton(
                onPressed: () => imagesController.selectMultiplePictures(),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(
                      color: VColors.primary), // Set the border color
                ),
                child: const Text(
                  'Upload photos',
                  style:
                      TextStyle(color: VColors.primary), // Set the text color
                ),
              ),
            ),
            const SizedBox(height: VSizes.spaceBtwSections),
            const VSellProductTitleDescription(),
            const SizedBox(height: VSizes.spaceBtwSections),
            const VCategoryDropdownButtons(),
            const SizedBox(height: VSizes.spaceBtwSections),
            const VSellProductAttributes(),
            const SizedBox(height: VSizes.spaceBtwSections),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => sellProductController.createProduct(),
                child: const Text(
                  'Upload',
                  style: TextStyle(color: VColors.white),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
