import 'package:priorities/domain/data/data_source.dart';
import 'package:priorities/domain/data/repository.dart';
import 'package:priorities/data/models/category.dart';

class CategoriesRepository implements IRepository<Category> {
  @override
  final IDataSource<Category> localSource;

  const CategoriesRepository({required this.localSource});

  Future<void> initDefaultValues() async {
    const defaultCategory1 = Category(title: 'Recent', isDefault: true, id: 1);
    await localSource.createOrUpdateMany(
      [defaultCategory1],
    );
  }

  Future<List<Category>> allDefaultCategories() async {
    final list = await localSource.all();
    return list.where((category) => category.isDefault).toList();
  }

  @override
  Future<Category> find(int id) {
    return localSource.find(id);
  }

  @override
  Future<List<Category>> findMany(Set<int> ids) {
    return localSource.findMany(ids);
  }

  @override
  Future<List<Category>> all() {
    return localSource.all();
  }

  @override
  Future<Category> createOrUpdate(Category category) {
    return localSource.createOrUpdate(category);
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
  Future<List<Category>> createOrUpdateMany(List<Category> objects) {
    throw UnimplementedError();
  }

  @override
  Future<List<Category>> where(Map<String, dynamic> query) {
    throw UnimplementedError();
  }
}
