import 'package:priorities/domain/data/data_sources/tasks_data_source.dart';
import 'package:priorities/domain/data/data_apis/tasks_data_apis.dart';
import 'package:priorities/data/models/priority.dart';

class TasksRepository implements TasksDataAPIS {
  final TasksDataSource localSource;

  const TasksRepository({required this.localSource});

  @override
  Future<List<T>> all() {
    return localSource.all();
  }

  @override
  Future<List<T>> allWithin(Priority priority) {
    return localSource.allWithin(priority);
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
  Future<T> find(int id) {
    return localSource.find(id);
  }

  @override
  Future<List<T>> findMany(Set<int> ids) {
    return localSource.findMany(ids);
  }

  @override
  Future<T> updateOrCreate(T object) {
    return localSource.updateOrCreate(object);
  }
}
