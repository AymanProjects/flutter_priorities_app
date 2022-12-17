import 'package:hive/hive.dart';

class UserPrefsService {
  final boxName = 'User_prefs';
  const UserPrefsService();

  final _selectedCategoryID = 0010;

  Future<int?> lastSelectedCategoryID() async {
    final box = await Hive.openBox(boxName);
    final result = await box.get(_selectedCategoryID);
    return result;
  }

  Future<void> updateLastSelectedCategory(int? id) async {
    final box = await Hive.openBox(boxName);
    return box.put(_selectedCategoryID, id);
  }
}
