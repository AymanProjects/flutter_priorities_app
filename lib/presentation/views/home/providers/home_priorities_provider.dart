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

  Future<void> createOrUpdate(Priority priority) async {
    state = const AsyncLoading();
    try {
      final isCreating = priority.id == null;
      // if we are creating a new Priority. We will assign this newly created Priority
      // to the default categories.
      if (isCreating) {
        final defaultCategories =
            await ref.read(defaultCategoriesProvider.future);
        priority = priority.copyWith(categories: [
          ...priority.categories,
          ...defaultCategories,
        ]);
      }
      final result =
          await ref.read(prioritiesRepoProvider).createOrUpdate(priority);
      state = AsyncData([
        result,
        ...state.valueOrNull ?? [],
      ]);
    } catch (e, st) {
      state = AsyncError<List<Priority>>(e, st).copyWithPrevious(state);
    }
  }
}
