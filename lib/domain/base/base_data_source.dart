import 'package:priorities/domain/base/base_entity.dart';

/// All data sources must extend this class.
/// An example of data source is: Sqfilte or Hive

abstract class BaseDataSource<T extends BaseEntity> {
  Future<void> init();
  Future<int> createOrUpdate(T entity);
  Future<List<T>> all();
  Future<bool> delete(int id);
}
