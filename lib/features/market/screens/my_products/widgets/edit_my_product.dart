import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vintaged/features/market/models/product_model.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/icons/circular_icon.dart';
import '../../../../../common/widgets/image_widgets/rounded_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/validators/validators.dart';
import '../../../controllers/category_controller.dart';
import '../../../controllers/edit_item_controller.dart';
import '../../../controllers/product/product_images_controller.dart';

class EditMyProduct extends StatelessWidget {
  const EditMyProduct({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final imagesController = Get.put(ProductImagesController());
    final editItemController = Get.put(EditItemController());
    final categoryController = CategoryController.instance;

    imagesController.loadProductImages(product.images);
    editItemController.initializeProduct(product);
    categoryController.loadProductCategories(product);

    return Scaffold(
      appBar: const VAppBar(title: Text('Edit Item'), showBackArrow: true),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(VSizes.defaultSpace),
        child: Form(
          key: editItemController.editItemFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 80,
                child: Obx(
                  () {
                    final allImages = [
                      ...imagesController.existingProductImages,
                      ...imagesController.productImages
                    ];

                    return allImages.isEmpty
                        ? const VRoundedImage(
                            width: 80, height: 80, image: VImages.emptyImage)
                        : ListView.separated(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            physics: const AlwaysScrollableScrollPhysics(),
                            separatorBuilder: (_, __) =>
                                const SizedBox(width: VSizes.spaceBtwItems),
                            itemCount: allImages.length,
                            itemBuilder: (_, index) {
                              final image = allImages[index];

                              final isNetworkImage = image is String;

                              return Stack(
                                children: [
                                  VRoundedImage(
                                    isNetworkImage: isNetworkImage,
                                    isFileImage: !isNetworkImage,
                                    height: 80,
                                    width: 80,
                                    image: isNetworkImage ? image : null,
                                    imageFile: !isNetworkImage
                                        ? File((image as XFile).path)
                                        : null,
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
                                      onPressed: () {
                                        isNetworkImage
                                            ? imagesController
                                                .removeNetworkImage(image)
                                            : imagesController
                                                .removeImage(image as XFile);
                                      },
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                  },
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
              TextFormField(
                controller: editItemController.title,
                validator: (value) =>
                    Validator.validateEmptyText('Item Title', value),
                expands: false,
                decoration: const InputDecoration(labelText: 'Title'),
              ),
              const SizedBox(height: VSizes.spaceBtwInputFields),
              TextFormField(
                expands: false,
                minLines: 3,
                maxLines: 5,
                controller: editItemController.description,
                validator: (value) =>
                    Validator.validateEmptyText('Description', value),
                decoration: const InputDecoration(
                    alignLabelWithHint: true, labelText: 'Description'),
              ),
              const SizedBox(height: VSizes.spaceBtwSections),
              Obx(
                () => DropdownButtonFormField(
                  validator: (value) =>
                      Validator.validateCategories('category', value),
                  decoration: const InputDecoration(labelText: 'Category'),
                  value: categoryController.selectedParentCategory.value,
                  onChanged: (value) {
                    categoryController.selectParentCategory(value);
                  },
                  items: categoryController.parentCategories
                      .map((category) => DropdownMenuItem(
                          value: category, child: Text(category.name)))
                      .toList(),
                ),
              ),
              const SizedBox(height: VSizes.spaceBtwInputFields),
              Obx(
                () => DropdownButtonFormField(
                  validator: (value) =>
                      Validator.validateCategories('subcategory', value),
                  decoration: const InputDecoration(labelText: 'Subcategory'),
                  value: categoryController.selectedSubCategory.value,
                  onChanged: (value) {
                    categoryController.selectedSubCategory.value = value;
                  },
                  items: categoryController.subCategories
                      .map((category) => DropdownMenuItem(
                          value: category, child: Text(category.name)))
                      .toList(),
                ),
              ),
              const SizedBox(height: VSizes.spaceBtwSections),
              TextFormField(
                controller: editItemController.brand,
                validator: (value) =>
                    Validator.validateEmptyText('Brand', value),
                expands: false,
                decoration: const InputDecoration(labelText: 'Brand'),
              ),
              const SizedBox(height: VSizes.spaceBtwInputFields),
              TextFormField(
                controller: editItemController.size,
                validator: (value) =>
                    Validator.validateEmptyText('Size', value),
                expands: false,
                decoration: const InputDecoration(labelText: 'Size'),
              ),
              const SizedBox(height: VSizes.spaceBtwInputFields),
              Obx(
                () => DropdownButtonFormField(
                  validator: (value) =>
                      Validator.validateCondition('condition', value),
                  decoration: const InputDecoration(labelText: 'Condition'),
                  value: editItemController.selectedCondition.value,
                  onChanged: (value) {
                    editItemController.selectedCondition.value = value;
                  },
                  items: ['Brand new', 'Very good', 'Good', 'Satisfactory']
                      .map((category) => DropdownMenuItem(
                          value: category, child: Text(category)))
                      .toList(),
                ),
              ),
              const SizedBox(height: VSizes.spaceBtwInputFields),
              TextFormField(
                controller: editItemController.weight,
                decoration: const InputDecoration(
                    labelText: 'Weight',
                    hintText:
                        'Enter weight (max 3 decimals) for precise CO₂ calculation',
                    hintStyle: TextStyle(color: VColors.grey, fontSize: 12)),
                validator: (value) =>
                    Validator.validateEmptyText('Weight', value),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,3}$')),
                ],
              ),
              const SizedBox(height: VSizes.spaceBtwInputFields),
              TextFormField(
                controller: editItemController.price,
                decoration: const InputDecoration(
                    labelText: 'Price',
                    hintText: 'Price with up-to 2 decimals',
                    hintStyle: TextStyle(color: VColors.grey)),
                validator: (value) =>
                    Validator.validateEmptyText('Price', value),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}$')),
                ],
              ),
              const SizedBox(height: VSizes.spaceBtwSections),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => editItemController.updateProduct(),
                  child: const Text(
                    'Save',
                    style: TextStyle(color: VColors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
