import 'package:priorities/data/repositories/categories_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:priorities/data/models/category.dart';
import 'package:priorities/injection.dart';
import 'dart:async';

final categoriesProvider =
    AsyncNotifierProvider<_CategroiesNotifier, List<Category>>(() {
  return _CategroiesNotifier();
});

class _CategroiesNotifier extends AsyncNotifier<List<Category>> {
  @override
  FutureOr<List<Category>> build() {
    return locator<CategoriesRepository>().all();
  }

  void createCategory(Category category) async {
    state = const AsyncLoading();
    try {
      final created =
          await locator<CategoriesRepository>().updateOrCreate(category);
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
