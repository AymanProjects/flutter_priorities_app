import 'package:priorities/presentation/__components/horizon_button.dart';
import 'package:flutter/material.dart';

class HorizonIconButton extends StatelessWidget {
  final void Function() onPressed;
  final IconData? icon;
  final double? width;
  final double height;
  final Color? iconColor;
  final Color? color;
  final String? text;

  const HorizonIconButton({
    required this.onPressed,
    required this.icon,
    this.width,
    this.height = 22.0,
    this.iconColor = Colors.grey,
    this.color = Colors.transparent,
    this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return HorizonButton(
      onPressed: onPressed,
      icon: icon,
      foregroundColor: iconColor,
      color: color,
      iconSize: height,
      height: height,
      width: width,
      text: text,
      padding: EdgeInsets.zero,
    );
  }
}
