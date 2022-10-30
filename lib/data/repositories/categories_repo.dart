import 'package:priorities/data/models/category.dart';
import 'package:priorities/domain/data/data_apis/categories_data_apis.dart';
import 'package:priorities/domain/data/data_sources/categories_data_source.dart';

class CategoriesRepository implements CategoriesDataAPIS {
  final CategoriesDataSource localSource;

  const CategoriesRepository({required this.localSource});

  @override
  Future<Category> find(String id) {
    return localSource.find(id);
  }

  @override
  Future<List<Category>> all() {
    return localSource.all();
  }

  @override
  Future<Category> updateOrCreate(Category category) {
    return localSource.updateOrCreate(category);
  }

  @override
  Future<void> delete(String id) {
    return localSource.delete(id);
  }

  @override
  Future<void> initDefaultValues() {
    return localSource.initDefaultValues();
  }

  @override
  Future<List<T>> allDefaultCategories() {
    return localSource.allDefaultCategories();
  }

  @override
  Future<void> deleteAll() {
    return localSource.deleteAll();
  }
}
