import 'package:priorities/domain/data/data_sources/tasks_data_source.dart';
import 'package:priorities/domain/data/repos/tasks_repo.dart';
import 'package:priorities/data/models/priority.dart';
import 'package:priorities/data/models/task.dart';

class TasksRepository implements ITasksRepo {
  final TasksDataSource localSource;

  const TasksRepository({required this.localSource});

  @override
  Future<List<Task>> all() {
    return localSource.all();
  }

  @override
  Future<List<Task>> tasksOf(Priority priority) {
    return localSource.tasksOf(priority);
  }

  @override
  Future<void> delete(int id) {
    return localSource.delete(id);
  }

  @override
  Future<void> deleteAll() {
    return localSource.deleteAll();
  }

  @override
  Future<Task> find(int id) {
    return localSource.find(id);
  }

  @override
  Future<List<Task>> findMany(Set<int> ids) {
    return localSource.findMany(ids);
  }

  @override
  Future<Task> createOrUpdate(Task object) {
    return localSource.createOrUpdate(object);
  }
}
