import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:priorities/data/models/category.dart';
import 'package:priorities/injection.dart';
import 'dart:async';

import 'package:priorities/services/user_prefs_service.dart';

final selectedCategoryProvider =
    AsyncNotifierProvider<_SelectedCategoryNotifier, Category>(() {
  return _SelectedCategoryNotifier();
});

class _SelectedCategoryNotifier extends AsyncNotifier<Category> {
  @override
  FutureOr<Category> build() async {
    return locator<UserPrefsService>().lastSelectedCategory();
  }

  void changeSelectedCategory(Category category) async {
    state = const AsyncLoading();
    try {
      await locator<UserPrefsService>().updateLastSelectedCategory(category);
      state = AsyncData(category);
    } catch (error, st) {
      state = AsyncError<Category>(error, st).copyWithPrevious(state);
    }
  }
}
