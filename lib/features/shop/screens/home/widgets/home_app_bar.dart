import 'package:flutter/material.dart';
import 'package:vintaged/common/widgets/appbar/appbar.dart';
import 'package:vintaged/common/widgets/products/cart/cart_counter_icon.dart';
import 'package:vintaged/utils/constants/colors.dart';
import 'package:vintaged/utils/constants/text_strings.dart';

class VHomeAppBar extends StatelessWidget {
  const VHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return VAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(VTexts.homeAppbarTitle, style: Theme.of(context).textTheme.labelMedium!.apply(color: VColors.lightGrey)),
          Text(VTexts.homeAppbarSubTitle, style: Theme.of(context).textTheme.headlineSmall!.apply(color: VColors.white)),
        ],
      ),
      actions: [
        VCartCounterIcon(
          onPressed: () {}
        )
      ],
    );
  }
}