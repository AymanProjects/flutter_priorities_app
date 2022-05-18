import 'package:flutter/material.dart';

class BlockEmoji extends StatelessWidget {
  const BlockEmoji({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      /// TODO
      onTap: () {},
      child: const Text(
        '🎃',
        style: TextStyle(
          fontSize: 24.0,
        ),
      ),
    );
  }
}
