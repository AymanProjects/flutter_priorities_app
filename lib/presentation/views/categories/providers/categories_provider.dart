import 'package:priorities/providers/repo_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:priorities/data/models/category.dart';
import 'dart:async';

final categoriesProvider =
    AsyncNotifierProvider<_CategroiesNotifier, List<Category>>(() {
  return _CategroiesNotifier();
});

class _CategroiesNotifier extends AsyncNotifier<List<Category>> {
  @override
  FutureOr<List<Category>> build() {
    return ref.read(categoriesRepoProvider).all();
  }

  void createOrUpdateCategory(Category category) async {
    state = const AsyncLoading();
    try {
      final created =
          await ref.read(categoriesRepoProvider).createOrUpdate(category);
      // merge the new created item + the old items
      state = AsyncData([
        created,
        ...state.value ?? [],
      ]);
    } catch (error, st) {
      state = AsyncError<List<Category>>(error, st).copyWithPrevious(state);
    }
  }
}
