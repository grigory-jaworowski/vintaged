import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:vintaged/utils/constants/sizes.dart';

import '../../../../../common/widgets/image_widgets/circular_image.dart';

class VCategoryItem extends StatelessWidget {
  const VCategoryItem({
    super.key,
    required this.title,
    required this.image,
    required this.onPressed,
  });

  final String title;
  final String image;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: VCircularImage(image: image, padding: VSizes.sm, isNetworkImage: true, radius: 0),
      title: Text(title, style: Theme.of(context).textTheme.bodyLarge),
      trailing: IconButton(
        onPressed: onPressed, 
        icon: const Icon(Iconsax.arrow_right_34, size: 18)
      ),
    );
  }
}