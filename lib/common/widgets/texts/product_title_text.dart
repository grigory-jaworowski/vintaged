import 'package:flutter/material.dart';

class VProductTitleText extends StatelessWidget {
  const VProductTitleText({super.key,
  required this.title,
  this.smallSize = false,
  this.maxLines = 2,
  this.textAlign = TextAlign.left
  });

  final String title;
  final bool smallSize;
  final int maxLines;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: smallSize ? Theme.of(context).textTheme.bodyLarge : Theme.of(context).textTheme.labelSmall,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
      textAlign: textAlign,
    );
  }
}