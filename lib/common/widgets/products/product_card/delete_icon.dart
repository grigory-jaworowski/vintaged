import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:vintaged/features/market/models/product_model.dart';

import '../../../../features/market/controllers/my_items_controller.dart';
import '../../../../utils/constants/colors.dart';
import '../../icons/circular_icon.dart';

class VDeleteIcon extends StatelessWidget {
  const VDeleteIcon({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = MyItemsController.instance;
    return  VCircularIcon(
        icon: Iconsax.trash,
        color: VColors.dark,
        backgroundColor: VColors.grey,
        width: 45,
        height: 45,
        size: 25,
        onPressed: () => controller.deleteProduct(product),
      );
  }
}
