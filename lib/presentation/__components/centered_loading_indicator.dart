import 'package:flutter/material.dart';

class CenteredLoadingIndicator extends StatelessWidget {
  const CenteredLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
