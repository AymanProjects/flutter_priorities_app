import 'package:priorities/data/sources/empty_data_source.dart';
import 'package:priorities/data/sources/sqflite/sqflite_data_source.dart';
import 'package:priorities/data/sources/sqflite/tables/priorities_table.dart';
import 'package:priorities/domain/base/base_repo.dart';
import 'package:priorities/domain/entities/priority.dart';

class PrioritiesRepo implements BaseRepo<Priority> {
  @override
  final localDataSource = const SqfilteDataSource(
    tableName: PrioritiesTable.tableName,
    fromMap: Priorities,
  );

  @override
  final remoteDataSource = EmptyDataSource();

  static PrioritiesRepo? _this;
  factory PrioritiesRepo() => _this ??= PrioritiesRepo._();
  PrioritiesRepo._();

  Future<int> create(Priority entity) {
    return localDataSource.create(entity);
  }

  Future<List<Priority>> all() {
    return localDataSource.all();
  }

  Future<bool> delete(int id) {
    return localDataSource.delete(id);
  }
}
