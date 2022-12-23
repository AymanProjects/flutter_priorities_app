import 'package:priorities/presentation/__components/horizon_button.dart';
import 'package:priorities/providers/service_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class CancelButton extends ConsumerWidget {
  const CancelButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return HorizonButton(
      text: 'Cancel',
      onPressed: () => onCancelPressed(ref),
      color: Colors.grey,
    );
  }

  void onCancelPressed(WidgetRef ref) async {
    ref.read(navigationServiceProvider).closeCurrentPage();
  }
}
