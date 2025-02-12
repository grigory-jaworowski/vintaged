import 'package:flutter/material.dart';
import 'package:vintaged/utils/constants/colors.dart';

class VSettingsMenuTile extends StatelessWidget {
  const VSettingsMenuTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subTitle,
    this.trailing,
    this.onPressed
  });

  final IconData icon;
  final String title, subTitle;
  final Widget? trailing;
  final GestureTapCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, size: 28, color: VColors.primary),
      title: Text(title, style: Theme.of(context).textTheme.titleMedium),
      subtitle: Text(subTitle, style: Theme.of(context).textTheme.labelMedium),
      trailing: trailing,
      onTap: onPressed,
    );
  }
}