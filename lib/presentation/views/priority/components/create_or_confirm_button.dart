import 'package:priorities/presentation/views/priority/providers/currently_viewed_priority.dart';
import 'package:priorities/presentation/views/priority/priority_view_model.dart';
import 'package:priorities/presentation/__components/horizon_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class CreateOrConfirmButton extends ConsumerWidget {
  const CreateOrConfirmButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.read(priorityViewModelProvider);
    final viewedPriority = ref.watch(currentlyViewedPriorityProvider);
    return HorizonButton(
      text: viewModel.isEditingMode ? 'Confirm' : 'Create',
      isLoading: viewedPriority.isLoading,
      onPressed: viewModel.onCreateOrConfirmButtonPressed,
    );
  }
}
