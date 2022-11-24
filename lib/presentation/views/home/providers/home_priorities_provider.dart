import 'package:priorities/presentation/views/home/providers/selected_category_provider.dart';
import 'package:priorities/providers/repository_providers/priorities_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:priorities/data/models/priority.dart';
import 'package:priorities/data/models/category.dart';
import 'dart:async';

final homePrioritiesProvider =
    AsyncNotifierProvider<_HomePrioritiesNotifier, List<Priority>>(() {
  return _HomePrioritiesNotifier();
});

class _HomePrioritiesNotifier extends AsyncNotifier<List<Priority>> {
  @override
  FutureOr<List<Priority>> build() async {
    final category = ref.watch(selectedCategoryProvider).value;
    final priorities = ref.watch(prioritiesRepoProvider).value;
    if (category == null || priorities == null) {
      return [];
    }
    return _getAllPrioritiesWithinCategory(category, priorities);
  }

  List<Priority> _getAllPrioritiesWithinCategory(
    Category category,
    List<Priority> priorities,
  ) {
    return [
      for (final element in priorities)
        if (element.categoryIDs.any((e) => e == category.id)) element,
    ];
  }
}
