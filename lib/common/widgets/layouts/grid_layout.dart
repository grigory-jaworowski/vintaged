import 'package:flutter/material.dart';
import 'package:vintaged/common/widgets/products/product_card/product_card.dart';
import 'package:vintaged/utils/constants/sizes.dart';

class VGridLayout extends StatelessWidget {
  const VGridLayout({
    super.key,
    required this.itemCount,
    this.mainAxisExtent = 235,
    required this.itemBuilder,
  });

  final int itemCount;
  final double? mainAxisExtent;
  final Widget? Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: itemCount,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: VSizes.gridViewSpacing,
        crossAxisSpacing: VSizes.gridViewSpacing,
        mainAxisExtent: mainAxisExtent),
      itemBuilder:  itemBuilder,
    );
  }
}