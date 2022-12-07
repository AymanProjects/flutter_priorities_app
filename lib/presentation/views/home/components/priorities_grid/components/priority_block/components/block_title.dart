import 'package:flutter/material.dart';

class BlockTitle extends StatelessWidget {
  final String title;

  const BlockTitle(
    this.title, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      maxLines: 1,
      softWrap: false,
      overflow: TextOverflow.fade,
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 16.0,
      ),
    );
  }
}
