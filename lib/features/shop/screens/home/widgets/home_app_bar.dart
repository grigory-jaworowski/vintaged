import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vintaged/common/widgets/appbar/appbar.dart';
import 'package:vintaged/common/widgets/icons/icon_with_counter.dart';
import 'package:vintaged/common/widgets/shimmers/shimmer_effect.dart';
import 'package:vintaged/features/personalization/controllers/user_controller.dart';
import 'package:vintaged/utils/constants/colors.dart';
import 'package:vintaged/utils/constants/text_strings.dart';

class VHomeAppBar extends StatelessWidget {
  const VHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return VAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(VTexts.homeAppbarTitle, style: Theme.of(context).textTheme.labelMedium!.apply(color: VColors.lightGrey)),
          Obx(() {
            if (controller.profileLoading.value) {
              // Display shimmer loader while user profile is being loaded
              return const VShimmerEffect(width: 80, height: 15);
            } else {
              return Text(controller.user.value.fullName, style: Theme.of(context).textTheme.headlineSmall!.apply(color: VColors.white));
            }
          }),
        ],
      ),
      actions: [
        VIconWithCounter(
          onPressed: () {}
        )
      ],
    );
  }
}