import 'package:flutter/material.dart';

class HomeViewTitle extends StatelessWidget {
  const HomeViewTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Your Priorities',
      style: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
