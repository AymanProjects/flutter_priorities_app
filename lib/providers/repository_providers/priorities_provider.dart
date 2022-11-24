import 'package:priorities/data/data_sources/local/priorities/hive_data_source.dart';
import 'package:priorities/data/repositories/priorities_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:priorities/data/models/priority.dart';
import 'dart:async';

final prioritiesRepoProvider =
    AsyncNotifierProvider<_PrioritiesRepoNotifier, List<Priority>>(() {
  return _PrioritiesRepoNotifier();
});

class _PrioritiesRepoNotifier extends AsyncNotifier<List<Priority>> {
  final repo = const PrioritiesRepository(
    localSource: HivePrioritiesLocalDataSource(),
  );

  @override
  FutureOr<List<Priority>> build() async {
    final priorities = await repo.all();
    priorities.sort((a, b) => b.id!.compareTo(a.id!));
    return priorities;
  }

  Future<void> createOrUpdatePriority(Priority priority) async {
    state = const AsyncLoading();
    try {
      // if priority.id != null, then we are updating the priority not creating a new one.
      final isUpdating = priority.id != null;
      final newPriority = await repo.updateOrCreate(priority);
      state = AsyncData([
        if (!isUpdating) newPriority,
        for (Priority element in state.value ?? [])
          if (element.id == priority.id) newPriority else element,
      ]);
    } catch (error, st) {
      state = AsyncError<List<Priority>>(error, st).copyWithPrevious(state);
    }
  }
}
