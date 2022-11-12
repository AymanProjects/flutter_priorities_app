import 'package:flutter/material.dart';

class BlockProgress extends StatelessWidget {
  final double? progress;

  const BlockProgress(
    this.progress, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      width: 20,
      child: CircularProgressIndicator(
        backgroundColor: Colors.white.withOpacity(0.3),
        valueColor: const AlwaysStoppedAnimation(Colors.white),
        value: progress,
        strokeWidth: 3.0,
      ),
    );
  }
}
