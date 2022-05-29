import 'package:flutter/material.dart';
import 'package:priorities/views/__components/horizon_button.dart';

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
    this.iconColor = Colors.black45,
    this.color = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HorizonButton(
      onTap: onTap,
      icon: icon,
      foregroundColor: iconColor,
      color: color,
      iconSize: iconSize,
      height: iconSize,
      width: iconSize,
      padding: EdgeInsets.zero,
    );
  }
}
