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
    final lastSelectedCategoryID =
        await ref.read(userPrefSerivceProvider).lastSelectedCategoryID();
    if (lastSelectedCategoryID is! int) {
      final defaultCategories =
          await ref.read(categoriesRepoProvider).allDefaultCategories();
      return defaultCategories.first;
    } else {
      return ref.read(categoriesRepoProvider).find(lastSelectedCategoryID);
    }
  }

  void changeSelectedCategory(Category category) async {
    state = const AsyncLoading();
    try {
      await ref
          .read(userPrefSerivceProvider)
          .updateLastSelectedCategory(category.id);
      state = AsyncData(category);
    } catch (error, st) {
      state = AsyncError<Category>(error, st).copyWithPrevious(state);
    }
  }
}
