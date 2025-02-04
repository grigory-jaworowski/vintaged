import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../features/shop/controllers/favourites_controller.dart';
import '../../../../utils/constants/colors.dart';
import '../../icons/circular_icon.dart';

class VFavouriteIcon extends StatelessWidget {
  const VFavouriteIcon({
    super.key,
    required this.productId,
  });

  final String productId;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavouritesController());
    return Obx(
      () => VCircularIcon(
        icon: controller.isFavourite(productId) ? Iconsax.heart5 : Iconsax.heart,
        color: VColors.red,
        onPressed: () => controller.toggleFavoriteProduct(productId),
      ),
    );
  }
}
