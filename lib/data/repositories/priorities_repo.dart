import 'package:priorities/domain/data/data_source.dart';
import 'package:priorities/domain/data/repository.dart';
import 'package:priorities/data/models/priority.dart';
import 'package:priorities/data/models/category.dart';

class PrioritiesRepository implements IRepository<Priority> {
  @override
  final IDataSource<Priority> localSource;

  const PrioritiesRepository({required this.localSource});

  @override
  Future<Priority> find(int id) {
    return localSource.find(id);
  }

  @override
  Future<List<Priority>> findMany(Set<int> ids) async {
    final records = await localSource.findMany(ids);
    records.sort((a, b) => b.id!.compareTo(a.id!));
    return records;
  }

  @override
  Future<List<Priority>> all() async {
    final records = await localSource.all();
    records.sort((a, b) => b.id!.compareTo(a.id!));
    return records;
  }

  @override
  Future<Priority> createOrUpdate(Priority priority) async {
    return localSource.createOrUpdate(priority);
  }

  @override
  Future<void> delete(int id) {
    return localSource.delete(id);
  }

  @override
  Future<void> deleteAll() {
    return localSource.deleteAll();
  }

  Future<List<Priority>> prioritiesOf(Category category) async {
    final allRecords = await all();
    final records = [
      for (final element in allRecords)
        if (element.categories.any((e) => e.id == category.id)) element,
    ];
    records.sort((a, b) => b.id!.compareTo(a.id!));
    return records;
  }

  @override
  Future<List<Priority>> createOrUpdateMany(List<Priority> objects) {
    throw UnimplementedError();
  }

  @override
  Future<List<Priority>> where(Map<String, dynamic> query) {
    throw UnimplementedError();
  }
}
