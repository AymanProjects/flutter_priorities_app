import 'package:priorities/domain/data/data_sources/categories_data_source.dart';
import 'package:priorities/domain/data/repos/categories_repo.dart';
import 'package:priorities/data/models/category.dart';

class CategoriesRepository implements ICategoriesRepo {
  final CategoriesDataSource localSource;

  const CategoriesRepository({required this.localSource});

  @override
  Future<void> initDefaultValues() {
    return localSource.initDefaultValues();
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
  Future<List<Category>> allDefaultCategories() {
    return localSource.allDefaultCategories();
  }

  @override
  Future<void> deleteAll() {
    return localSource.deleteAll();
  }
}
