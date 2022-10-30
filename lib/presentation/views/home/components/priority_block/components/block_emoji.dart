import 'package:flutter/material.dart';

class BlockEmoji extends StatelessWidget {
  final String emoji;
  const BlockEmoji(
    this.emoji, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      emoji,
      style: const TextStyle(
        fontSize: 24.0,
      ),
    );
  }
}
