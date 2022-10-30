import 'package:priorities/data/models/priority.dart';
import 'package:priorities/domain/data/data_apis/priorities_data_apis.dart';
import 'package:priorities/domain/data/data_sources/priorities_data_source.dart';

class PrioritiesRepository implements PrioritiesDataAPIS {
  final PrioritiesDataSource localSource;

  const PrioritiesRepository({required this.localSource});

  @override
  Future<Priority> find(String id) {
    return localSource.find(id);
  }

  @override
  Future<List<Priority>> all() {
    return localSource.all();
  }

  @override
  Future<Priority> updateOrCreate(Priority priority) {
    return localSource.updateOrCreate(priority);
  }

  @override
  Future<void> delete(String id) {
    return localSource.delete(id);
  }

  @override
  Future<void> deleteAll() {
    return localSource.deleteAll();
  }
}
