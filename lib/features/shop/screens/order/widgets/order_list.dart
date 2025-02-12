import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:vintaged/utils/constants/colors.dart';
import 'package:vintaged/utils/constants/sizes.dart';

import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../navigation_menu.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/helpers/cloud_helper_functions.dart';
import '../../../../../utils/loaders/animation_loader.dart';
import '../../../controllers/order_controller.dart';

class VOrderListItems extends StatelessWidget {
  const VOrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OrderController());
    return FutureBuilder(
        future: controller.fetchUserOrders(),
        builder: (_, snapshot) {
          /// Nothing Found Widget
          final emptyWidget = VAnimationLoaderWidget(
            text: 'Whoops! No Orders Yet!',
            animation: VImages.orderCompletedAnimation,
            showAction: true,
            actionText: 'Let\'s fill it',
            onActionPressed: () => Get.off(() => const NavigationMenu()),
          );

          /// Helper Function: Handle Loader, No Record, OR ERROR Message
          final response = VCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, nothingFound: emptyWidget);
          if (response != null) return response;

          /// Congratulations 🎊 Record found.
          final orders = snapshot.data!;
          return ListView.separated(
            shrinkWrap: true,
            itemCount: orders.length,
            separatorBuilder: (_, index) => const SizedBox(height: VSizes.spaceBtwItems),
            itemBuilder: (_, index) {
              final order = orders[index];
              return VRoundedContainer(
                padding: const EdgeInsets.all(VSizes.sm),
                backgroundColor: VColors.light,
                child: Column(
                  children: [
                    /// -- Top Row
                    Row(
                      children: [
                        /// 1 - Image
                        const Icon(Iconsax.ship),
                        const SizedBox(width: VSizes.spaceBtwItems / 2),

                        /// 2 - Status & Date
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                order.orderStatusText,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.bodyLarge!.apply(color: VColors.primary, fontWeightDelta: 1),
                              ),
                              Text(order.formattedOrderDate, style: Theme.of(context).textTheme.headlineSmall),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: VSizes.spaceBtwItems),

                    /// -- Bottom Row
                    Row(
                      children: [
                        /// Order No
                        Expanded(
                          child: Row(
                            children: [
                              /// 1 - Icon
                              const Icon(Iconsax.tag),
                              const SizedBox(width: VSizes.spaceBtwItems / 2),

                              /// Order
                              Flexible(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Order',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context).textTheme.labelMedium,
                                    ),
                                    Text(
                                      order.id,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context).textTheme.titleMedium,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        /// Delivery Date
                        Expanded(
                          child: Row(
                            children: [
                              /// 1 - Icon
                              const Icon(Iconsax.calendar),
                              const SizedBox(width: VSizes.spaceBtwItems / 2),

                              /// Status & Date
                              Flexible(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Shipping Date',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context).textTheme.labelMedium,
                                    ),
                                    Text(
                                      order.formattedDeliveryDate,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context).textTheme.titleMedium,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        });
  }
}