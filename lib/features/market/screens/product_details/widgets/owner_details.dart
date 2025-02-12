import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vintaged/features/market/controllers/product/product_details_controller.dart';

import '../../../../../common/widgets/image_widgets/circular_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';

class VOwnerDetails extends StatelessWidget {
  const VOwnerDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final productDetailsController = ProductDetailsController.instance;
    return Obx(() {
      final image = productDetailsController
              .productOwner.value.profilePicture.isNotEmpty
          ? productDetailsController
              .productOwner.value.profilePicture
          : VImages.userIcon;
    
      return ListTile(
        contentPadding: EdgeInsets.zero,
        leading:
            VCircularImage(image: image, isNetworkImage: true),
        title: Text(
            productDetailsController
                    .productOwner.value.fullName.isNotEmpty
                ? productDetailsController
                    .productOwner.value.fullName
                : "Unknown Seller",
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .apply(color: VColors.black)),
      );
    });
  }
}