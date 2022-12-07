import 'package:priorities/presentation/views/priority/providers/currently_viewed_priority.dart';
import 'package:priorities/presentation/__components/horizon_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class CreateOrConfirmButton extends ConsumerWidget {
  const CreateOrConfirmButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewedPriorityProvider = ref.read(currentlyViewedPriority.notifier);
    final priority = ref.watch(currentlyViewedPriority);
    return HorizonButton(
      text: viewedPriorityProvider.isInEditingMode ? 'Confirm' : 'Create',
      isLoading: priority.isLoading,
      onPressed: () => onCreateOrConfirmButtonPressed(ref),
    );
  }

  void onCreateOrConfirmButtonPressed(WidgetRef ref) async {
    ref.read(currentlyViewedPriority.notifier).createOrUpdate();
  }
}
