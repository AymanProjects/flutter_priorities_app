import 'package:priorities/domain/data/data_sources/priorities_data_source.dart';
import 'package:priorities/domain/data/repos/priorities_repo.dart';
import 'package:priorities/data/models/category.dart';
import 'package:priorities/data/models/priority.dart';

class PrioritiesRepository implements IPrioritiesRepo {
  final PrioritiesDataSource localSource;

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

  @override
  Future<List<Priority>> prioritiesOf(Category category) async {
    final records = await localSource.prioritiesOf(category);
    records.sort((a, b) => b.id!.compareTo(a.id!));
    return records;
  }
}
