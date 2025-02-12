import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vintaged/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:vintaged/common/widgets/image_widgets/rounded_image.dart';
import 'package:vintaged/common/widgets/shimmers/shimmer_effect.dart';
import 'package:vintaged/features/market/controllers/banner_controller.dart';
import 'package:vintaged/utils/constants/colors.dart';
import 'package:vintaged/utils/constants/sizes.dart';

class VPromoSlider extends StatelessWidget {
  const VPromoSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());
    return Obx(() {
      if (controller.isLoading.value) {
        return const VShimmerEffect(width: double.infinity, height: 190);
      }

      if (controller.allBanners.isEmpty) {
        return Center(
            child: Text('No Data Found!',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .apply(color: Colors.black)));
      } else {
        return Column(
          children: [
            CarouselSlider(
                options: CarouselOptions(
                    viewportFraction: 1,
                    onPageChanged: (index, _) =>
                        controller.updatePageIndicator(index)),
                items: controller.allBanners
                    .map((banner) => VRoundedImage(
                        image: banner.imageUrl,
                        isNetworkImage: true,
                        onTap: () => Get.toNamed(banner.targetScreen)))
                    .toList()),
            const SizedBox(height: VSizes.spaceBtwItems),
            Center(
              child: Obx(
                () => Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    for (int i = 0; i < controller.allBanners.length; i++)
                      VCircularContainer(
                        width: 20,
                        height: 4,
                        margin: const EdgeInsets.only(right: 10),
                        backgroundColor:
                            controller.carouselCurrentIndex.value == i
                                ? VColors.primary
                                : VColors.grey,
                      ),
                  ],
                ),
              ),
            )
          ],
        );
      }
    });
  }
}
