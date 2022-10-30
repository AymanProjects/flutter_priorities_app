import 'package:flutter/material.dart';

/// TODO put in Horizon UI kit
class HorizonButton extends StatelessWidget {
  final String? text;
  final IconData? icon;
  final double? iconSize;
  final EdgeInsets? padding;
  final void Function() onPressed;
  final bool isLoading;
  final Color? color;
  final Color? borderColor;
  final Color? foregroundColor;
  final double borderRadius;
  final double? width;
  final double? height;

  const HorizonButton({
    required this.onPressed,
    this.text,
    this.icon,
    this.iconSize = 22.0,
    this.padding,
    this.isLoading = false,
    this.color,
    this.borderColor,
    this.foregroundColor,
    this.width,
    this.height = 48.0,
    this.borderRadius = 8.0,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextButton(
        onPressed: isLoading ? null : onPressed,
        style: _buildStyle(
          color ?? Theme.of(context).primaryColor,
          foregroundColor ?? Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text ?? '',
              style: const TextStyle(fontSize: 16.0),
            ),
            if (icon != null && text != null) const SizedBox(width: 10.0),
            if (icon != null)
              FittedBox(
                child: Icon(
                  icon,
                  size: iconSize,
                ),
              ),
          ],
        ),
      ),
    );
  }

  ButtonStyle _buildStyle(Color color, Color textColor) {
    return ButtonStyle(
      minimumSize: MaterialStateProperty.all(Size.zero),
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      animationDuration: Duration.zero,
      padding: MaterialStateProperty.all(padding),
      shape: MaterialStateProperty.all<OutlinedBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          side: borderColor == null
              ? BorderSide.none
              : BorderSide(color: borderColor!),
        ),
      ),
      backgroundColor: MaterialStateProperty.resolveWith<Color?>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            if (color == Colors.transparent) {
              return color;
            }
            return color.withOpacity(0.6);
          }
          if (states.contains(MaterialState.focused) ||
              states.contains(MaterialState.pressed)) {
            if (color == Colors.transparent) {
              return color;
            }
            return color.withOpacity(0.8);
          }
          return color; // Defer to the widget's default.
        },
      ),
      overlayColor: MaterialStateProperty.resolveWith<Color>((states) {
        return Colors.transparent;
      }),
      foregroundColor: MaterialStateProperty.resolveWith<Color>((states) {
        if (states.contains(MaterialState.disabled)) {
          return textColor.withOpacity(0.8);
        }
        if (states.contains(MaterialState.pressed)) {
          return textColor.withOpacity(0.6);
        } else {
          return textColor;
        }
      }),
    );
  }
}
