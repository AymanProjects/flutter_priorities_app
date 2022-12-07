import 'package:priorities/data/clients/hive_client.dart';
import 'package:priorities/data/models/category.dart';

class UserPrefsService {
  final client = const HiveStorageClient(boxName: 'user_prefs');
  final selectedCategoryKey = 'selectedCategory';

  const UserPrefsService();

  Future<Category?> lastSelectedCategory() async {
    final result = await client.find(key: selectedCategoryKey);
    if (result != null) {
      final map = Map<String, dynamic>.from(result);
      return Category.fromJson(map);
    }
    return null;
  }

  Future<void> updateLastSelectedCategory(Category category) {
    return client.updateOrCreate(
      key: selectedCategoryKey,
      value: category.toJson(),
    );
  }
}
