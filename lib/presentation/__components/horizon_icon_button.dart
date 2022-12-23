import 'package:priorities/presentation/__components/horizon_button.dart';
import 'package:flutter/material.dart';

class HorizonThinButton extends StatelessWidget {
  final void Function() onPressed;
  final String? text;
  final double textSize;
  final IconData? icon;
  final double? iconSize;
  final double? width;
  final double? height;
  final Color? iconColor;
  final Color? color;
  final bool stretch;

  const HorizonThinButton({
    required this.onPressed,
    this.text,
    this.textSize = 16.0,
    this.icon,
    this.iconSize,
    this.width,
    this.height,
    this.iconColor = Colors.grey,
    this.color = Colors.transparent,
    this.stretch = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return HorizonButton(
      onPressed: onPressed,
      text: text,
      textSize: textSize,
      icon: icon,
      foregroundColor: iconColor,
      color: color,
      iconSize: iconSize ?? height,
      height: height,
      width: width,
      padding: EdgeInsets.zero,
      stretch: stretch,
    );
  }
}
