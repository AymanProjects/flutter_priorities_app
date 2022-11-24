import 'package:priorities/providers/repository_providers/priorities_provider.dart';
import 'package:priorities/data/constants/ui_constants.dart';
import 'package:priorities/services/navigation_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:priorities/data/models/priority.dart';
import 'package:priorities/injection.dart';
import 'dart:math';

final currentlyViewedPriorityProvider =
    AsyncNotifierProvider<_CurrentlyViewedPriorityNotifier, Priority>(
  () => _CurrentlyViewedPriorityNotifier(),
);

class _CurrentlyViewedPriorityNotifier extends AsyncNotifier<Priority> {
  @override
  Priority build() {
    return Priority(
      id: null,
      emoji: '📔',
      title: '',
      colorId: Random().nextInt(kCardColors.length),
      categoryIDs: [],
      taskIDs: [],
    );
  }

  bool get isEditingMode => state.value?.id != null;

  void setPriority(Priority Function(Priority oldData) callback) {
    if (state.value != null) {
      state = AsyncData(callback(state.value!));
    }
  }

  void createOrUpdatePriority() async {
    try {
      final priority = state.value;
      if (priority != null) {
        state = const AsyncLoading();
        await ref
            .read(prioritiesRepoProvider.notifier)
            .createOrUpdatePriority(priority);
        state = AsyncData(priority);
        locator<NavigationService>().closeCurrentPage();
      }
    } catch (error, st) {
      state = AsyncError<Priority>(error, st).copyWithPrevious(state);
    }
  }
}
