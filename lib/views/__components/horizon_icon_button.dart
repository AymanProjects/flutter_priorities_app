import 'package:flutter/material.dart';
import 'package:priorities/views/__components/horizon_button.dart';

class HorizonIconButton extends StatelessWidget {
  final void Function() onTap;
  final IconData? icon;
  final double? width;
  final double height;
  final Color? iconColor;
  final Color? color;
  final String? text;

  const HorizonIconButton({
    Key? key,
    required this.onTap,
    required this.icon,
    this.width,
    this.height = 22.0,
    this.iconColor = Colors.black45,
    this.color = Colors.white,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HorizonButton(
      onTap: onTap,
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
