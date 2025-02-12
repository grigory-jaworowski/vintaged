import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/products/product_card/product_card.dart';
import '../../../../common/widgets/shimmers/vertical_shimmer.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/loaders/animation_loader.dart';
import '../../controllers/my_items_controller.dart';
import '../sell_product/sell_product.dart';
import 'widgets/edit_my_item.dart';

class MyItemsScreen extends StatelessWidget {
  const MyItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MyItemsController());

    return Scaffold(
      appBar: VAppBar(
        showBackArrow: true,
        title:
            Text('My Items', style: Theme.of(context).textTheme.headlineMedium),
      ),
      body: Padding(
        padding: const EdgeInsets.all(VSizes.defaultSpace),
        child: Obx(() {
          if (controller.isLoading.value) {
            return const VerticalProductShimmer(itemCount: 6);
          }

          if (controller.myProducts.isEmpty) {
            return VAnimationLoaderWidget(
              text: 'Whoops! Looks like you do not have any items...',
              animation: VImages.pencilAnimation,
              showAction: true,
              actionText: 'Let\'s add some',
              onActionPressed: () => Get.off(() => const SellProduct()),
            );
          }

          return VGridLayout(
            itemCount: controller.myProducts.length,
            itemBuilder: (_, index) => VProductCard(
                product: controller.myProducts[index],
                onTap: () => Get.to(
                    () => EditMyItem(product: controller.myProducts[index])),
                toBeDeletedProduct: true),
          );
        }),
      ),
    );
  }
}
