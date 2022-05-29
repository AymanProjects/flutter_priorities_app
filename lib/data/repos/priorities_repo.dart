import 'package:priorities/data/sources/empty_data_source.dart';
import 'package:priorities/data/sources/objectbox_data_source.dart';
import 'package:priorities/domain/base/base_repo.dart';
import 'package:priorities/domain/entities/priority.dart';

class PrioritiesRepo implements BaseRepo<Priority> {
  @override
  final localDataSource = ObjectBoxDataSource();

  @override
  final remoteDataSource = EmptyDataSource();

  static PrioritiesRepo? _this;
  factory PrioritiesRepo() => _this ??= PrioritiesRepo._();
  PrioritiesRepo._();

  @override
  Future<void> init() async {
    await localDataSource.init();
    await remoteDataSource.init();
  }

  @override
  Future<int> createOrUpdate(Priority entity) {
    return localDataSource.createOrUpdate(entity);
  }

  @override
  Future<List<Priority>> all() {
    return localDataSource.all();
  }

  @override
  Future<bool> delete(int id) {
    return localDataSource.delete(id);
  }
}
