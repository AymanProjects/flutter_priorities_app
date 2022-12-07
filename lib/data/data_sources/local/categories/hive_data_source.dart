import 'package:priorities/domain/data/data_sources/categories_data_source.dart';
import 'package:priorities/data/clients/hive_client.dart';
import 'package:priorities/data/models/category.dart';

class HiveCategoriesLocalDataSource implements CategoriesDataSource {
  final client = const HiveStorageClient(boxName: 'categories');

  const HiveCategoriesLocalDataSource();

  @override
  Future<void> initDefaultValues() async {
    const defaultCategory1 = Category(title: 'Recent', isDefault: true, id: 1);
    await client.updateOrCreateMany(
      values: {defaultCategory1.id: defaultCategory1.toJson()},
    );
  }

  @override
  Future<Category> find(int id) async {
    final map = Map<String, dynamic>.from(await client.find(key: id));
    return Category.fromJson(map);
  }

  @override
  Future<List<Category>> findMany(Set<int> ids) async {
    final allCategories = await all();
    final records =
        allCategories.where((element) => ids.contains(element.id)).toList();
    return records;
  }

  @override
  Future<List<Category>> all() async {
    final list = await client.all();
    final listOfMaps = list.map((e) => Map<String, dynamic>.from(e)).toList();
    final allRecords = listOfMaps.map((map) => Category.fromJson(map)).toList();
    return allRecords;
  }

  @override
  Future<Category> createOrUpdate(Category object) async {
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
  Future<List<Category>> allDefaultCategories() async {
    final list = await all();
    return list.where((category) => category.isDefault).toList();
  }

  @override
  Future<void> deleteAll() {
    return client.deleteAll();
  }
}
