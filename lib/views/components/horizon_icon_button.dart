import 'package:flutter/material.dart';
import 'package:priorities/views/components/horizon_button.dart';

class HorizonIconButton extends StatelessWidget {
  final void Function() onTap;
  final IconData? icon;
  final double iconSize;
  final Color? iconColor;
  final Color? color;

  const HorizonIconButton({
    Key? key,
    required this.onTap,
    required this.icon,
    this.iconSize = 22.0,
    this.iconColor,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HorizonButton(
      onTap: onTap,
      icon: icon,
      foregroundColor: iconColor ?? Colors.grey,
      color: color ?? Colors.white,
      iconSize: iconSize,
      height: iconSize,
      width: iconSize,
      padding: EdgeInsets.zero,
    );
  }
}
