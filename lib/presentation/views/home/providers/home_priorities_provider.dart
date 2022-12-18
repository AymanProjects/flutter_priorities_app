import 'package:priorities/domain/extensions/asyncnotifier_extensions.dart';
import 'package:priorities/presentation/views/home/providers/selected_category_provider.dart';
import 'package:priorities/presentation/views/priority/providers/default_categories_provider.dart';
import 'package:priorities/providers/repo_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:priorities/data/models/priority.dart';
import 'dart:async';

final homePrioritiesProvider =
    AsyncNotifierProvider<_HomePrioritiesNotifier, List<Priority>>(() {
  return _HomePrioritiesNotifier();
});

class _HomePrioritiesNotifier extends AsyncNotifier<List<Priority>> {
  @override
  FutureOr<List<Priority>> build() async {
    final category = ref.watch(selectedCategoryProvider).valueOrNull;
    if (category == null) {
      return [];
    }
    return ref.read(prioritiesRepoProvider).prioritiesOf(category);
  }

  Future<void> createPriority(Priority priority) async {
    runLoadingOperation(() async {
      final defaultCategories =
          await ref.read(defaultCategoriesProvider.future);
      priority = priority.copyWith(categories: [
        ...priority.categories,
        ...defaultCategories,
      ]);
      final result =
          await ref.read(prioritiesRepoProvider).createOrUpdate(priority);
      state = AsyncData([
        result,
        ...state.valueOrNull ?? [],
      ]);
    });
  }

  Future<void> updatePriority(Priority priority) async {
    runLoadingOperation(() async {
      final result =
          await ref.read(prioritiesRepoProvider).createOrUpdate(priority);
      final updatedList = (state.valueOrNull ?? []).map((priority) {
        if (priority.id == result.id) {
          return result;
        } else {
          return priority;
        }
      }).toList();
      state = AsyncData(updatedList);
    });
  }
}
