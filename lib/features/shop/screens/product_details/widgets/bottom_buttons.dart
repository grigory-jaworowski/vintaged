import 'package:flutter/material.dart';
import 'package:vintaged/utils/constants/sizes.dart';

import '../../../../../utils/constants/colors.dart';

class VBottomButtons extends StatelessWidget {
  const VBottomButtons({
    super.key,
    required this.color,
    required this.borderColor
  });

  final Color color;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: VSizes.defaultSpace, vertical: VSizes.defaultSpace / 2),
      decoration: BoxDecoration(
        color: color,
        border: Border(
          top: BorderSide(
            color: borderColor,
            width: 2,
          )
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(VSizes.md),
                  backgroundColor: VColors.brown,
                ),
                child: const Text('Add to Cart')
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(VSizes.md),
                  backgroundColor: VColors.brown,
                ),
                child: const Text('Make Offer')
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(VSizes.md),
                ),
                child: const Text('Buy')
              ),
            ),
          )
        ],
      ),
    );
  }
}