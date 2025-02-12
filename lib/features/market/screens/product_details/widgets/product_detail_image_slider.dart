import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/custom_shapes/curved_edges/curved_edges_widgets.dart';
import '../../../../../common/widgets/image_widgets/rounded_image.dart';
import '../../../../../common/widgets/products/product_card/favourite_icon.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../controllers/product/product_images_controller.dart';
import '../../../models/product_model.dart';

class VProductImageSlider extends StatelessWidget {
  const VProductImageSlider({
    super.key,
    required this.product,
    this.isNetworkImage = true,
  });

  final ProductModel product;
  final bool isNetworkImage;

  @override
  Widget build(BuildContext context) {
    final imagesController = Get.put(ProductImagesController());

    final images = imagesController.getAllProductImages(product);
    return VCurvedEdgeWidget(
      child: Container(
        color: VColors.light,
        child: Stack(
          children: [
            // Main large image
            SizedBox(
                height: 530,
                child: Center(child: Obx(() {
                  final image = imagesController.selectedProductImage.value;
                  return GestureDetector(
                    onTap: () => imagesController.showEnlargedImage(image),
                    child: SizedBox.expand(
                      child: isNetworkImage
                        ? CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl: image,
                            progressIndicatorBuilder:
                                (_, __, downloadProgress) =>
                                    Center(
                                      child: SizedBox(
                                        height: 40,
                                        width: 40,
                                        child: CircularProgressIndicator(
                                            value: downloadProgress.progress,
                                            color: VColors.primary),
                                      ),
                                    ),
                            errorWidget: (_, __, ___) =>
                                const Icon(Icons.error),
                          )
                        : Image(image: AssetImage(image)),
                    ) 
                  );
                }))),

            // Image slider
            Positioned(
              right: 0,
              bottom: 30,
              left: VSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: const AlwaysScrollableScrollPhysics(),
                    separatorBuilder: (_, __) =>
                        const SizedBox(width: VSizes.spaceBtwItems),
                    itemCount: images.length,
                    itemBuilder: (_, index) {
                      return Obx(() {
                        final isSelected =
                            imagesController.selectedProductImage.value ==
                                images[index];
                        return VRoundedImage(
                          isNetworkImage: isNetworkImage,
                          width: 80,
                          border: Border.all(
                            color: isSelected
                                ? VColors.primary
                                : Colors.transparent, // Highlight selection
                          ),
                          image: images[index],
                          onTap: () => imagesController
                              .selectedProductImage.value = images[index],
                        );
                      });
                    }),
              ),
            ),
            // Appbar
            Positioned(
              top: 20,
              left: 0,
              right: 0,
              child: VAppBar(
                showBackArrow: true,
                actions: [
                  VFavouriteIcon(productId: product.id),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
