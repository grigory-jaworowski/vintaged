import 'package:flutter/material.dart';
import 'package:vintaged/common/widgets/layouts/grid_layout.dart';
import 'package:vintaged/common/widgets/shimmers/shimmer_effect.dart';

import '../../../utils/constants/sizes.dart';

class VerticalProductShimmer extends StatelessWidget {
  const VerticalProductShimmer({super.key, required this.itemCount});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return VGridLayout(
        itemCount: itemCount,
        itemBuilder: (_, __) => const SizedBox(
              width: 180,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  VShimmerEffect(width: 180, height: 180),
                  SizedBox(height: VSizes.spaceBtwItems),
                  VShimmerEffect(width: 160, height: 15),
                  SizedBox(height: VSizes.spaceBtwItems / 2),
                  VShimmerEffect(width: 110, height: 15),
                ],
              ),
            ));
  }
}
