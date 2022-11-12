import 'package:flutter/material.dart';

class BlockEmoji extends StatelessWidget {
  final String emoji;
  const BlockEmoji(
    this.emoji, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(
        emoji,
        softWrap: false,
        overflow: TextOverflow.fade,
        style: const TextStyle(
          fontSize: 24.0,
        ),
      ),
    );
  }
}
