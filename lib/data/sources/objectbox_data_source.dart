import 'package:priorities/domain/base/base_entity.dart';
import 'package:priorities/domain/base/base_data_source.dart';
import 'package:priorities/objectbox.g.dart';

class ObjectBoxDataSource<T extends BaseEntity> implements BaseDataSource<T> {
  late final Store store;

  @override
  Future init() async {
    store = await openStore();
  }

  @override
  Future<int> createOrUpdate(T entity) async {
    final box = store.box<T>();
    return box.put(entity);
  }

  @override
  Future<List<T>> all() async {
    final box = store.box<T>();
    return box.getAll();
  }

  @override
  Future<bool> delete(int id) async {
    final box = store.box<T>();
    return box.remove(id);
  }
}
