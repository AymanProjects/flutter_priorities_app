import 'package:priorities/presentation/views/priority/providers/currently_viewed_priority.dart';
import 'package:priorities/presentation/__components/horizon_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:priorities/providers/service_providers.dart';

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
