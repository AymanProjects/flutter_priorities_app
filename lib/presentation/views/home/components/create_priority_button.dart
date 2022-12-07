import 'package:priorities/presentation/views/priority/providers/currently_viewed_priority.dart';
import 'package:priorities/presentation/views/priority/priority_view.dart';
import 'package:priorities/presentation/__components/horizon_button.dart';
import 'package:priorities/providers/service_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class CreatePriorityButton extends ConsumerWidget {
  const CreatePriorityButton({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return HorizonButton(
      onPressed: () => createPriorityButtonOnTap(ref),
      icon: Icons.add_rounded,
      width: double.infinity,
      iconSize: 32.0,
    );
  }

  void createPriorityButtonOnTap(WidgetRef ref) async {
    ref.invalidate(currentlyViewedPriority);
    ref.read(navigationServiceProvider).openPage(const PriorityView());
  }
}
