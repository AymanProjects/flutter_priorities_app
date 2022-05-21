import 'package:flutter/material.dart';

class ListFader extends StatelessWidget {
  final Widget child;
  final Color endColor;

  const ListFader({
    Key? key,
    required this.child,
    required this.endColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.dstOut,
      shaderCallback: (Rect bounds) {
        return LinearGradient(
          begin: Alignment.center,
          end: Alignment.bottomCenter,
          colors: <Color>[Colors.transparent, endColor],
        ).createShader(bounds);
      },
      child: child,
    );
  }
}
