import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:vintaged/common/widgets/appbar/appbar.dart';
import 'package:vintaged/common/widgets/texts/section_heading.dart';
import 'package:vintaged/features/personalization/screens/widgets/profile_menu.dart';
import 'package:vintaged/utils/constants/colors.dart';

import '../../../common/widgets/image_widgets/circular_image.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
import '../controllers/user_controller.dart';
import 'widgets/change_fullname.dart';
import 'widgets/profile_menu_detail.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
       appBar: const VAppBar(showBackArrow: true, title: Text('Profile')),

       // Body
       body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(VSizes.defaultSpace),
          child: Column(
            children: [
              // Profile Picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    const VCircularImage(image: VImages.testAppLogo, width: 80, height: 80),
                    TextButton(onPressed: () {}, child: const Text('Change Profile Picture'))
                  ],
                ),
              ),

              // Details
              const Divider(),
              const SizedBox(height: VSizes.spaceBtwItems / 2),
              const VSectionHeading(title: 'Profile Information', showActionButton: false),
              const SizedBox(height: VSizes.spaceBtwItems / 2),

              VProfileMenu(title: 'Full Name', value: controller.user.value.fullName, onPressed: () => Get.to(() => const ChangeFullname())),
              VProfileMenu(title: 'Username', value: controller.user.value.username, onPressed: () => Get.to(() => const VProfileMenuDetail(data: 'Username'))),

              const SizedBox(height: VSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: VSizes.spaceBtwItems / 2),

              const VSectionHeading(title: 'Personal Information', showActionButton: false),
              const SizedBox(height: VSizes.spaceBtwItems / 2),

              VProfileMenu(title: 'User ID', value: controller.user.value.id, onPressed: () => {}, icon: Iconsax.copy),
              VProfileMenu(title: 'E-Mail', value: controller.user.value.email, onPressed: () => Get.to(() => const VProfileMenuDetail(data: 'E-Mail'))),
              VProfileMenu(title: 'Phone Number', value: controller.user.value.phoneNumber, onPressed: () => Get.to(() => const VProfileMenuDetail(data: 'Phone Number'))),
              VProfileMenu(title: 'Gender', value: 'Male', onPressed: () => Get.to(() => const VProfileMenuDetail(data: 'Gender'))),
              VProfileMenu(title: 'Date of Birth', value: '21.01.2000', onPressed: () => Get.to(() => const VProfileMenuDetail(data: 'Date of Birth'))),
              VProfileMenu(title: 'City', value: 'Benidorm', onPressed: () => Get.to(() => const VProfileMenuDetail(data: 'City'))),
              VProfileMenu(title: 'Address line', value: 'Severo Ochoa 29', onPressed: () => Get.to(() => const VProfileMenuDetail(data: 'Address line'))),
              VProfileMenu(title: 'Postcode', value: '03503', onPressed: () => Get.to(() => const VProfileMenuDetail(data: 'Postcode'))),
              const Divider(),

              Center(
                child: TextButton(
                  onPressed: () => controller.deleteAccountWarningPopup(),
                  child: const Text('Delete Account', style: TextStyle(color: VColors.red))
                ),
              )
            ],
          ),
        ),

       ),
    );
  }
}