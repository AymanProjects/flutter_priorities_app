import 'package:priorities/domain/base/base_entity.dart';

/// All data sources must extend this class.
/// An example of data source is: Sqfilte or Hive

abstract class BaseDataSource<T extends BaseEntity> {
  Future<void> create(T entity);
  Future<void> createMany(List<T> entity);
  Future<void> delete(T entity);
  Future<T> find(int id);
  Future<List<T>> all();

  const BaseDataSource();
}
