import 'package:priorities/data/constants/ui_constants.dart';
import 'package:flutter/material.dart';

class SmallPadding extends StatelessWidget {
  const SmallPadding({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: kSmPadding,
      width: kSmPadding,
    );
  }
}
