import 'package:priorities/data/clients/hive_client.dart';
import 'package:priorities/data/models/category.dart';
import 'package:priorities/data/repositories/categories_repo.dart';
import 'package:priorities/injection.dart';

class UserPrefs {
  final client = const HiveStorageClient(boxName: 'user_prefs');
  final selectedCategoryKey = 'selectedCategory';

  const UserPrefs();

  Future<Category> lastSelectedCategory() async {
    final result = await client.find(key: selectedCategoryKey);
    if (result != null) {
      final map = Map<String, dynamic>.from(result);
      return Category.fromMap(map);
    } else {
      final defaultCategory =
          (await locator<CategoriesRepository>().allDefaultCategories()).first;
      return defaultCategory;
    }
  }

  Future<void> updateLastSelectedCategory(Category category) {
    return client.updateOrCreate(
      key: selectedCategoryKey,
      value: category.toMap(),
    );
  }
}
