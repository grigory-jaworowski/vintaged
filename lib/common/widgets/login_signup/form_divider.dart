
import 'package:flutter/material.dart';
import 'package:vintaged/utils/constants/colors.dart';

class VFormDivider extends StatelessWidget {
  const VFormDivider({
    super.key,
    required this.dividerText,
  });
  
  final String dividerText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Flexible(child: Divider(color: VColors.grey, thickness: 0.5, indent: 60, endIndent: 5)),
        Text(dividerText, style: Theme.of(context).textTheme.labelMedium),
        const Flexible(child: Divider(color: VColors.grey, thickness: 0.5, indent: 5, endIndent: 60)),
      ],
    );
  }
}