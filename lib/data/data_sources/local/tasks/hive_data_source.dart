import 'package:priorities/domain/data/data_sources/tasks_data_source.dart';
import 'package:priorities/data/clients/hive_client.dart';
import 'package:priorities/data/models/priority.dart';
import 'package:priorities/data/models/task.dart';

class HiveTaskasksLocalDataSource implements TasksDataSource {
  final client = const HiveStorageClient(boxName: 'tasks');

  const HiveTaskasksLocalDataSource();

  @override
  Future<Task> find(int id) async {
    final map = Map<String, dynamic>.from(await client.find(key: id));
    return Task.fromJson(map);
  }

  @override
  Future<List<Task>> findMany(Set<int> ids) async {
    final allRecords = await all();
    return allRecords.where((element) => ids.contains(element.id)).toList();
  }

  @override
  Future<List<Task>> all() async {
    final list = await client.all();
    final listOfMaps = list.map((e) => Map<String, dynamic>.from(e)).toList();
    return listOfMaps.map((map) => Task.fromJson(map)).toList();
  }

  @override
  Future<List<Task>> tasksOf(Priority priority) async {
    final allRecords = await all();
    return allRecords.where((task) => task.priority.id == priority.id).toList();
  }

  @override
  Future<Task> createOrUpdate(Task object) async {
    if (object.id == null) {
      object = object.copyWith(id: await client.generateID());
    }
    await client.updateOrCreate(
      key: object.id,
      value: object.toJson(),
    );
    return object;
  }

  @override
  Future<void> delete(int id) {
    return client.delete(key: id);
  }

  @override
  Future<void> deleteAll() {
    return client.deleteAll();
  }
}
