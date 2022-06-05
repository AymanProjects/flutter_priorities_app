import 'package:priorities/domain/base/base_entity.dart';
import 'package:priorities/domain/base/base_data_source.dart';

/// act as a place holder

class EmptyDataSource<T extends BaseEntity> extends BaseDataSource<T> {
  @override
  Future<List<T>> all() {
    throw Exception();
  }

  @override
  Future<int> create(T entity) {
    throw Exception();
  }

  @override
  Future<bool> delete(T entity) {
    throw Exception();
  }

  @override
  Future<void> createMany(List<T> entity) {
    throw Exception();
  }

  @override
  Future<T> find(int id) {
    throw Exception();
  }
}
