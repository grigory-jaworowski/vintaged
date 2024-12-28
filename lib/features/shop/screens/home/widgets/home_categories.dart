import 'package:flutter/material.dart';
import 'package:vintaged/common/widgets/image_text_widgets/vertical_image_text.dart';
import 'package:vintaged/common/widgets/texts/section_heading.dart';
import 'package:vintaged/utils/constants/colors.dart';
import 'package:vintaged/utils/constants/image_strings.dart';
import 'package:vintaged/utils/constants/sizes.dart';

class VHomeCategories extends StatelessWidget {
  const VHomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: VSizes.defaultSpace),
      child: Column(
        children: [
          // Heading
          const VSectionHeading(title: 'Popular categories', showActionButton: false, textColor: VColors.white),
          const SizedBox(height: VSizes.spaceBtwItems),
    
          // Category items
          SizedBox(
            height: 80,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 6,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                return VerticalImageText(image: VImages.testAppLogo, title: 'Jeans', onTap: (){});
              }
            ),
          )
        ],
      ),
    );
  }
}