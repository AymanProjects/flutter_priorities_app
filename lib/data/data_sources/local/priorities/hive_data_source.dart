import 'package:priorities/domain/data/data_sources/priorities_data_source.dart';
import 'package:priorities/data/clients/hive_client.dart';
import 'package:priorities/data/models/priority.dart';

class HivePrioritiesLocalDataSource implements PrioritiesDataSource {
  final client = const HiveStorageClient(boxName: 'priorities');

  const HivePrioritiesLocalDataSource();

  @override
  Future<Priority> find(String id) async {
    final map = await client.read(
      key: id,
    );
    return Priority.fromMap(map);
  }

  @override
  Future<List<Priority>> all() async {
    final list = await client.readAll();
    return list
        .map((map) => Priority.fromMap(Map<String, dynamic>.from(map)))
        .toList();
  }

  @override
  Future<Priority> updateOrCreate(Priority priority) async {
    if (priority.id == null) {
      final id = await client.generateID();
      priority = priority.copyWith(id: id);
    }
    await client.write(
      key: priority.id!,
      value: priority.toMap(),
    );
    return priority;
  }

  @override
  Future<void> delete(String id) {
    return client.delete(key: id);
  }

  @override
  Future<void> deleteAll() {
    return client.deleteAll();
  }
}
