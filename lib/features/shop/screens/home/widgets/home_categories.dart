import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vintaged/common/widgets/image_text_widgets/vertical_image_text.dart';
import 'package:vintaged/common/widgets/shimmers/category_shimmer.dart';
import 'package:vintaged/common/widgets/texts/section_heading.dart';
import 'package:vintaged/features/shop/controllers/category_controller.dart';
import 'package:vintaged/utils/constants/colors.dart';
import 'package:vintaged/utils/constants/sizes.dart';

class VHomeCategories extends StatelessWidget {
  const VHomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());

    return Padding(
      padding: const EdgeInsets.only(left: VSizes.defaultSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Heading
          const VSectionHeading(title: 'Popular categories', showActionButton: false, textColor: VColors.white),
          const SizedBox(height: VSizes.spaceBtwItems),
    
          // Category items
          Obx(
            () {
              if(controller.isLoading.value) return VCategoryShimmer(itemCount: controller.featuredCategories.length);

              if(controller.featuredCategories.isEmpty){
                return Center(child: Text('No Data Found!', style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white)));
              }

              return SizedBox(
                height: 80,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.featuredCategories.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                    final category = controller.featuredCategories[index];
                    return VerticalImageText(image: category.image, title: category.name, onTap: (){});
                  }
                ),
              );
            } 
          )
        ],
      ),
    );
  }
}