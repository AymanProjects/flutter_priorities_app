import 'package:flutter/cupertino.dart';
import 'package:priorities/presentation/views/home/providers/home_priorities_provider.dart';
import 'package:priorities/data/constants/ui_constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:priorities/data/models/priority.dart';
import 'dart:math';

import 'package:priorities/presentation/views/priority/providers/form_key.dart';
import 'package:priorities/providers/service_providers.dart';

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

  void setPriority(Priority Function(Priority oldData) callback) {
    update(callback);
  }

  void createOrUpdate() async {
    var priority = state.valueOrNull;
    if (priority != null) {
      state = const AsyncLoading();
      final key = ref.read(priorityViewFormKey);
      if (key.currentState?.validate() ?? false) {
        FocusManager.instance.primaryFocus?.unfocus(); // closes keyboard
        await ref
            .read(homePrioritiesProvider.notifier)
            .createOrUpdate(priority);
        ref.read(navigationServiceProvider).closeCurrentPage();
      }
      state = AsyncData(priority);
    }
  }
}
