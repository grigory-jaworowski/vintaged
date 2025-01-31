import 'package:flutter/material.dart';
import 'package:vintaged/common/widgets/shimmers/shimmer_effect.dart';
import 'package:vintaged/utils/constants/sizes.dart';

class VCategoryShimmer extends StatelessWidget {
  const VCategoryShimmer({
    super.key,
    required this.itemCount
  });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: itemCount,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_, __) => const SizedBox(width: VSizes.spaceBtwItems),
        itemBuilder: (_, __) {
          return const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VShimmerEffect(width: 56, height: 56, radius: 56),
              SizedBox(height: VSizes.spaceBtwItems / 2),

              VShimmerEffect(width: 56, height: 8),
            ],
          );
        },
      ),
    );
  }
}