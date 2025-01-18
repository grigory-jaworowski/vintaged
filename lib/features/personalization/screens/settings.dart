import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:vintaged/common/widgets/appbar/appbar.dart';
import 'package:vintaged/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:vintaged/common/widgets/image_widgets/circular_image.dart';
import 'package:vintaged/common/widgets/list_tile/settings_menu_tile.dart';
import 'package:vintaged/common/widgets/texts/section_heading.dart';
import 'package:vintaged/features/personalization/screens/profile.dart';
import 'package:vintaged/utils/constants/colors.dart';
import 'package:vintaged/utils/constants/sizes.dart';

import '../../../utils/constants/image_strings.dart';
import '../../shop/screens/order/order.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            VPrimaryHeaderContainer(
              child: Column(
                children: [
                  // Appbar
                  VAppBar(title: Text('Account', style: Theme.of(context).textTheme.headlineMedium!.apply(color: VColors.white))),

                  // User Profile Card
                  ListTile(
                    leading: const VCircularImage(image: VImages.testAppLogo),
                    title: Text('Name Surname', style: Theme.of(context).textTheme.headlineSmall!.apply(color: VColors.white)),
                    subtitle: Text('example@example.com', style: Theme.of(context).textTheme.bodyMedium!.apply(color: VColors.white)),
                    trailing: IconButton(
                      onPressed: () => Get.to(() => const ProfileScreen()), 
                      icon: const Icon(Iconsax.edit, color: VColors.white)
                    ),
                  ),
                  const SizedBox(height: VSizes.spaceBtwSections),
                ],
              ),
            ),

            // Body
            Padding(
              padding: const EdgeInsets.all(VSizes.defaultSpace),
              child: Column(
                children: [
                  const VSectionHeading(title: 'Account Settings'),
                  const SizedBox(height: VSizes.spaceBtwItems),

                 const VSettingsMenuTile(
                    icon: Iconsax.safe_home,
                    title: 'My Address',
                    subTitle: 'Set my delivary address',
                  ),
                  const VSettingsMenuTile(icon: Iconsax.shopping_cart, title: 'My Cart', subTitle: 'Add, remove items and move to checkout'),
                  VSettingsMenuTile(
                    icon: Iconsax.bag_tick,
                    title: 'My Orders',
                    subTitle: 'In-progress and Completed Orders',
                    onPressed: () => Get.to(() => const OrderScreen())
                  ),
                  const VSettingsMenuTile(icon: Iconsax.bank, title: 'Payment', subTitle: 'Add your payment methods'),

                  const SizedBox(height: VSizes.spaceBtwSections),
                  const VSectionHeading(title: 'App Settings', showActionButton: false),
                  const SizedBox(height: VSizes.spaceBtwItems),
                  VSettingsMenuTile(
                    icon: Iconsax.location, title: 'Location',
                    subTitle: 'Set recomendation based on your location',
                    trailing: Switch(value: true, onChanged: (value){}),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
