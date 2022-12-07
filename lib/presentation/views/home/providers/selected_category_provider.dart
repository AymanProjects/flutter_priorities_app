import 'package:priorities/providers/service_providers.dart';
import 'package:priorities/providers/repo_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:priorities/data/models/category.dart';
import 'dart:async';

final selectedCategoryProvider =
    AsyncNotifierProvider<_SelectedCategoryNotifier, Category>(() {
  return _SelectedCategoryNotifier();
});

class _SelectedCategoryNotifier extends AsyncNotifier<Category> {
  @override
  FutureOr<Category> build() async {
    final lastSelected =
        await ref.read(userPrefSerivceProvider).lastSelectedCategory();
    if (lastSelected == null) {
      final defaultCategories =
          await ref.read(categoriesRepoProvider).allDefaultCategories();
      return defaultCategories.first;
    } else {
      return lastSelected;
    }
  }

  void changeSelectedCategory(Category category) async {
    state = const AsyncLoading();
    try {
      await ref
          .read(userPrefSerivceProvider)
          .updateLastSelectedCategory(category);
      state = AsyncData(category);
    } catch (error, st) {
      state = AsyncError<Category>(error, st).copyWithPrevious(state);
    }
  }
}
