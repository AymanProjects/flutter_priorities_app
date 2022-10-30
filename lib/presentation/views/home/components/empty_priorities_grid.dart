import 'package:flutter/material.dart';

class EmptyPrioritiesGrid extends StatelessWidget {
  const EmptyPrioritiesGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Create a new priority using the button below 💡',
        style: TextStyle(
          fontSize: 12.0,
          color: Colors.grey,
        ),
      ),
    );
  }
}
