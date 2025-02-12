import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../features/market/controllers/favourites_controller.dart';
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
        backgroundColor: VColors.grey,
        width: 45,
        height: 45,
        size: 25,
        onPressed: () => controller.toggleFavoriteProduct(productId),
      ),
    );
  }
}
