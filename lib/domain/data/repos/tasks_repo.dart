import 'package:priorities/domain/data/repository.dart';
import 'package:priorities/data/models/priority.dart';
import 'package:priorities/data/models/task.dart';

abstract class ITasksRepo implements IRepository<Task> {
  const ITasksRepo();

  Future<List<Task>> tasksOf(Priority priority);
}
