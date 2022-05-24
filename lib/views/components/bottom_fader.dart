import 'package:flutter/material.dart';

class BottomFader extends StatelessWidget {
  final Widget child;

  const BottomFader({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.dstOut,
      shaderCallback: (Rect bounds) {
        return const LinearGradient(
          begin: Alignment.center,
          end: Alignment.bottomCenter,
          stops: [0.4, 0.8],
          colors: <Color>[
            Colors.transparent,
            Colors.black,
          ],
        ).createShader(bounds);
      },
      child: child,
    );
  }
}
