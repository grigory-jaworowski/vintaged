import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:vintaged/common/widgets/appbar/appbar.dart';
import 'package:vintaged/common/widgets/shimmers/shimmer_effect.dart';
import 'package:vintaged/common/widgets/texts/section_heading.dart';
import 'package:vintaged/features/personalization/screens/change_phone_number.dart';
import 'package:vintaged/features/personalization/screens/change_username.dart';
import 'package:vintaged/features/personalization/screens/widgets/profile_menu.dart';
import 'package:vintaged/utils/constants/colors.dart';

import '../../../common/widgets/image_widgets/circular_image.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
import '../controllers/user_controller.dart';
import 'change_fullname.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    
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
                    Obx(() {
                      final networkImage = controller.user.value.profilePicture;
                      final image = networkImage.isNotEmpty
                          ? networkImage
                          : VImages.userIcon;

                      return controller.imageUploading.value
                          ? const VShimmerEffect(
                              width: 80, height: 80, radius: 80)
                          : VCircularImage(
                              image: image,
                              width: 80,
                              height: 80,
                              isNetworkImage: networkImage.isNotEmpty);
                    }),
                    TextButton(
                        onPressed: () => controller.uploadProfilePicture(),
                        child: const Text('Change Profile Picture'))
                  ],
                ),
              ),

              // Details
              const Divider(),
              const SizedBox(height: VSizes.spaceBtwItems / 2),
              const VSectionHeading(
                  title: 'Profile Information', showActionButton: false),
              const SizedBox(height: VSizes.spaceBtwItems / 2),

              VProfileMenu(
                  title: 'Full Name',
                  value: controller.user.value.fullName,
                  onPressed: () => Get.to(() => const ChangeFullname())),
              VProfileMenu(
                  title: 'Username',
                  value: controller.user.value.username,
                  onPressed: () => Get.to(() => const ChangeUsername())),

              const SizedBox(height: VSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: VSizes.spaceBtwItems / 2),

              const VSectionHeading(
                  title: 'Personal Information', showActionButton: false),
              const SizedBox(height: VSizes.spaceBtwItems / 2),

              InkWell(
                child: VProfileMenu(
                    title: 'User ID',
                    value: controller.user.value.id,
                    onPressed: () => {Clipboard.setData(ClipboardData(text: controller.user.value.id))},
                    icon: Iconsax.copy),
              ),
              VProfileMenu(
                  icon: null,
                  title: 'E-Mail',
                  value: controller.user.value.email),
              VProfileMenu(
                  title: 'Phone Number',
                  value: controller.user.value.phoneNumber,
                  onPressed: () => Get.to(
                      () => const ChangePhoneNumber())),
              
              const Divider(),
              
              Center(
                child: TextButton(
                    onPressed: () => controller.deleteAccountWarningPopup(),
                    child: const Text('Delete Account',
                        style: TextStyle(color: VColors.red))),
              )
            ],
          ),
        ),
      ),
    );
  }
}
