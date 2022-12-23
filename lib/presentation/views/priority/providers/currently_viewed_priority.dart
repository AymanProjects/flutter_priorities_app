import 'package:flutter/cupertino.dart';
import 'package:priorities/presentation/views/home/providers/home_priorities_provider.dart';
import 'package:priorities/data/constants/ui_constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:priorities/data/models/priority.dart';
import 'package:priorities/presentation/views/priority/providers/form_key.dart';
import 'package:priorities/providers/service_providers.dart';
import 'dart:math';

final currentlyViewedPriority =
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
      categories: [],
      tasks: [],
    );
  }

  bool get isInEditingMode => state.valueOrNull?.id != null;

  void updateState(Priority Function(Priority oldData) callback) {
    update(callback);
  }

  void createOrUpdate() async {
    var priority = state.valueOrNull;
    if (priority != null) {
      state = const AsyncLoading();
      final isCreating = priority.id == null;
      final key = ref.read(priorityViewFormKey);
      if (key.currentState?.validate() ?? false) {
        FocusManager.instance.primaryFocus?.unfocus(); // closes keyboard
        if (isCreating) {
          await ref
              .read(homePrioritiesProvider.notifier)
              .createPriority(priority);
        } else {
          await ref
              .read(homePrioritiesProvider.notifier)
              .updatePriority(priority);
        }
        ref.read(navigationServiceProvider).closeCurrentPage();
      }
      state = AsyncData(priority);
    }
  }
}
