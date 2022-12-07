import 'package:priorities/data/data_sources/local/categories/hive_data_source.dart';
import 'package:priorities/data/data_sources/local/priorities/hive_data_source.dart';
import 'package:priorities/data/data_sources/local/tasks/hive_data_source.dart';
import 'package:priorities/data/repositories/categories_repo.dart';
import 'package:priorities/data/repositories/priorities_repo.dart';
import 'package:priorities/data/repositories/tasks_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final prioritiesRepoProvider = Provider((ref) {
  return const PrioritiesRepository(
    localSource: HivePrioritiesLocalDataSource(),
  );
});

final categoriesRepoProvider = Provider((ref) {
  return const CategoriesRepository(
    localSource: HiveCategoriesLocalDataSource(),
  );
});

final tasksRepoProvider = Provider((ref) {
  return const TasksRepository(
    localSource: HiveTaskasksLocalDataSource(),
  );
});
