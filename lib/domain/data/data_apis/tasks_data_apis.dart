import 'package:priorities/data/models/priority.dart';
import 'package:priorities/data/models/task.dart';
import 'package:priorities/domain/data/crud.dart';

typedef T = Task;

abstract class TasksDataAPIS implements CRUD<T> {
  const TasksDataAPIS();

  Future<List<T>> allWithin(Priority priority);
}
