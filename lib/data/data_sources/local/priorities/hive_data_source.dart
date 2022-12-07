import 'package:priorities/domain/data/data_sources/priorities_data_source.dart';
import 'package:priorities/data/clients/hive_client.dart';
import 'package:priorities/data/models/category.dart';
import 'package:priorities/data/models/priority.dart';

class HivePrioritiesLocalDataSource implements PrioritiesDataSource {
  final client = const HiveStorageClient(boxName: 'priorities');

  const HivePrioritiesLocalDataSource();

  @override
  Future<Priority> find(int id) async {
    final map = Map<String, dynamic>.from(
      await client.find(key: id),
    );
    return Priority.fromJson(map);
  }

  @override
  Future<List<Priority>> findMany(Set<int> ids) async {
    final allRecords = await all();
    return allRecords.where((element) => ids.contains(element.id)).toList();
  }

  @override
  Future<List<Priority>> all() async {
    final list = await client.all();
    final listOfMaps = list.map((e) => Map<String, dynamic>.from(e)).toList();
    return listOfMaps.map((map) => Priority.fromJson(map)).toList();
  }

  @override
  Future<Priority> createOrUpdate(Priority object) async {
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

  @override
  Future<List<Priority>> prioritiesOf(Category category) async {
    final allRecords = await all();
    return [
      for (final element in allRecords)
        if (element.categories.any((e) => e.id == category.id)) element,
    ];
  }
}
