import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:priorities/data/models/category.dart';
import 'package:priorities/providers/repo_providers.dart';

final defaultCategoriesProvider =
    AsyncNotifierProvider<_DefaultCategoriesNotifier, List<Category>>(
  () => _DefaultCategoriesNotifier(),
);

class _DefaultCategoriesNotifier extends AsyncNotifier<List<Category>> {
  @override
  FutureOr<List<Category>> build() {
    return ref.read(categoriesRepoProvider).allDefaultCategories();
  }
}
