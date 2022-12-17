import 'package:priorities/data/data_sources/local/hive_data_source.dart';
import 'package:priorities/data/repositories/tasks_repository.dart';
import 'package:priorities/data/repositories/categories_repo.dart';
import 'package:priorities/data/repositories/priorities_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:priorities/data/models/category.dart';
import 'package:priorities/data/models/priority.dart';
import 'package:priorities/data/models/task.dart';

final prioritiesRepoProvider = Provider((ref) {
  return PrioritiesRepository(
    localSource: HiveDataSource(
      fromJson: Priority.fromJson,
      toJson: (object) => object.toJson(),
      boxName: 'Priorities',
    ),
  );
});

final categoriesRepoProvider = Provider((ref) {
  return CategoriesRepository(
    localSource: HiveDataSource(
      fromJson: Category.fromJson,
      toJson: (object) => object.toJson(),
      boxName: 'Categories',
    ),
  );
});

final tasksRepoProvider = Provider((ref) {
  return TasksRepository(
    localSource: HiveDataSource(
      fromJson: Task.fromJson,
      toJson: (object) => object.toJson(),
      boxName: 'Tasks',
    ),
  );
});
