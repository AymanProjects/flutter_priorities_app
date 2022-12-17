import 'package:priorities/domain/data/data_source.dart';
import 'package:priorities/domain/data/repository.dart';
import 'package:priorities/data/models/priority.dart';
import 'package:priorities/data/models/task.dart';

class TasksRepository implements IRepository<Task> {
  @override
  final IDataSource<Task> localSource;

  const TasksRepository({required this.localSource});

  Future<List<Task>> tasksOf(Priority priority) async {
    final allRecords = await localSource.all();
    return allRecords.where((task) => task.priority.id == priority.id).toList();
  }

  @override
  Future<List<Task>> all() {
    return localSource.all();
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

  @override
  Future<List<Task>> createOrUpdateMany(List<Task> objects) {
    throw UnimplementedError();
  }

  @override
  Future<List<Task>> where(Map<String, dynamic> query) {
    throw UnimplementedError();
  }
}
