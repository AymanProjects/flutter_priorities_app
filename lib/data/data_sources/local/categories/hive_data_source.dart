import 'package:priorities/domain/data/data_sources/categories_data_source.dart';
import 'package:priorities/data/clients/hive_client.dart';
import 'package:priorities/data/models/category.dart';

class HiveCategoriesLocalDataSource implements CategoriesDataSource {
  final client = const HiveStorageClient(boxName: 'categories');

  const HiveCategoriesLocalDataSource();

  @override
  Future<void> initDefaultValues() async {
    const defaultCategory = Category(id: '0', title: 'Recent');
    await client.write(
      key: defaultCategory.id!,
      value: defaultCategory.toMap(),
    );
  }

  @override
  Future<Category> find(String id) async {
    final map = await client.read(
      key: id,
    );
    return Category.fromMap(map);
  }

  @override
  Future<List<Category>> all() async {
    final list = await client.readAll();
    return list
        .map((map) => Category.fromMap(Map<String, dynamic>.from(map)))
        .toList();
  }

  @override
  Future<Category> updateOrCreate(Category category) async {
    if (category.id == null) {
      final id = await client.generateID();
      category = category.copyWith(id: id);
    }
    await client.write(
      key: category.id!,
      value: category.toMap(),
    );
    return category;
  }

  @override
  Future<void> delete(String id) {
    return client.delete(key: id);
  }

  @override
  Future<List<Category>> allDefaultCategories() async {
    final list = await client.readAll();
    final categories = list.map((map) => Category.fromMap(map)).toList();
    return categories.where((category) => category.isDefault ?? false).toList();
  }

  @override
  Future<void> deleteAll() {
    return client.deleteAll();
  }
}
