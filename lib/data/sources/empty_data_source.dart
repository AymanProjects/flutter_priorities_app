import 'package:priorities/domain/base/base_entity.dart';
import 'package:priorities/domain/base/base_data_source.dart';

/// act as a place holder

class EmptyDataSource<T extends BaseEntity> extends BaseDataSource<T> {
  @override
  Future<List<T>> all() {
    throw Exception();
  }

  @override
  Future<int> createOrUpdate(T entity) {
    throw Exception();
  }

  @override
  Future<bool> delete(int id) {
    throw Exception();
  }

  @override
  Future<void> init() async {}
}
