import 'package:priorities/data/constants/ui_constants.dart';
import 'package:flutter/material.dart';

class LargePadding extends StatelessWidget {
  const LargePadding({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: kLgPadding,
      width: kLgPadding,
    );
  }
}
