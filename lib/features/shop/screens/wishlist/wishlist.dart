import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vintaged/common/widgets/appbar/appbar.dart';
import 'package:vintaged/common/widgets/layouts/grid_layout.dart';
import 'package:vintaged/common/widgets/products/product_card/product_card.dart';
import 'package:vintaged/navigation_menu.dart';
import 'package:vintaged/utils/constants/sizes.dart';

import '../../../../common/widgets/shimmers/vertical_shimmer.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/helpers/cloud_helper_functions.dart';
import '../../../../utils/loaders/animation_loader.dart';
import '../../controllers/favourites_controller.dart';
import '../../models/product_model.dart';
import '../home/home.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VAppBar(
        showBackArrow: true,
        title: Text('Whishlist', style: Theme.of(context).textTheme.headlineMedium),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(VSizes.defaultSpace),
          child: Column(
            children: [
              Obx(() {
                  return FutureBuilder(
                    future: FavouritesController.instance.favoriteProducts(),
                    builder: (_, snapshot) {
                      /// Nothing Found Widget
                      final emptyWidget = VAnimationLoaderWidget(
                        text: 'Whoops! Wishlist is Empty...',
                        animation: VImages.pencilAnimation,
                        showAction: true,
                        actionText: 'Let\'s add some',
                        onActionPressed: () => Get.offAll(() => const NavigationMenu()),
                      );
                      const loader = VerticalProductShimmer(itemCount: 6);
                      final widget = VCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader, nothingFound: emptyWidget);
                      if (widget != null) return widget;

                      final products = snapshot.data!;
                      return VGridLayout(
                        itemCount: products.length,
                        itemBuilder: (_, index) => VProductCard(product: products[index]),
                      );
                    },
                  );
                }),
            ],
          ),
        ),
      ),

    );
  }
}