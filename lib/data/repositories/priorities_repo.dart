import 'package:priorities/domain/data/data_sources/priorities_data_source.dart';
import 'package:priorities/domain/data/data_apis/priorities_data_apis.dart';
import 'package:priorities/data/repositories/categories_repo.dart';
import 'package:priorities/data/models/category.dart';
import 'package:priorities/data/models/priority.dart';
import 'package:priorities/injection.dart';

class PrioritiesRepository implements PrioritiesDataAPIS {
  final PrioritiesDataSource localSource;

  const PrioritiesRepository({required this.localSource});

  @override
  Future<Priority> find(int id) {
    return localSource.find(id);
  }

  @override
  Future<List<Priority>> findMany(Set<int> ids) {
    return localSource.findMany(ids);
  }

  @override
  Future<List<Priority>> all() {
    return localSource.all();
  }

  @override
  Future<Priority> updateOrCreate(Priority priority) async {
    // Assign the Priority to the default Categories
    final defaultCategories =
        await locator<CategoriesRepository>().allDefaultCategories();
    priority.categoryIDs.addAll(defaultCategories.map((e) => e.id!).toSet());
    // Update or create
    return localSource.updateOrCreate(priority);
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
  Future<List<T>> allWithin(Category category) {
    return localSource.allWithin(category);
  }
}
