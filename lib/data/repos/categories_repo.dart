import 'package:priorities/data/sources/empty_data_source.dart';
import 'package:priorities/domain/base/base_repo.dart';
import 'package:priorities/domain/entities/category.dart';

class CategoriesRepo implements BaseRepo<Category> {
  @override
  final localDataSource = ObjectBoxDataSource();

  @override
  final remoteDataSource = EmptyDataSource();

  static CategoriesRepo? _this;
  factory CategoriesRepo() => _this ??= CategoriesRepo._();
  CategoriesRepo._();


  /add update method
  @override
  Future<int> create(Category entity) {
    return localDataSource.create(entity);
  }

  @override
  Future<List<Category>> all() {
    return localDataSource.all();
  }

  @override
  Future<bool> delete(int id) {
    return localDataSource.delete(id);
  }
}
