import 'package:path_provider/path_provider.dart';
import 'package:hive/hive.dart';

/// A helper class for wrapping the 3rd-party Hive package

class HiveStorageClient<T> {
  final String boxName;

  const HiveStorageClient({required this.boxName});

  static Future init() async {
    Hive.init((await getApplicationDocumentsDirectory()).path);
  }

  Future<int> generateID() async {
    final box = await Hive.openBox<T>(boxName);
    return box.length + 1;
  }

  Future<T?> find({
    required key,
  }) async {
    final box = await Hive.openBox<T>(boxName);
    return box.get(key);
  }

  Future<List<T>> all() async {
    final box = await Hive.openBox<T>(boxName);
    return box.values.toList();
  }

  Future<bool> valueExists({
    required key,
  }) async {
    final box = await Hive.openBox<T>(boxName);
    return box.keys.contains(key);
  }

  Future<T> updateOrCreate({
    required key,
    required T value,
  }) async {
    final box = await Hive.openBox<T>(boxName);
    await box.put(key, value);
    await box.flush();
    return value;
  }

  Future<void> updateOrCreateMany({
    required Map<dynamic, T> values,
  }) async {
    final box = await Hive.openBox<T>(boxName);
    await box.putAll(values);
    await box.flush();
  }

  Future<void> delete({
    required key,
  }) async {
    final box = await Hive.openBox<T>(boxName);
    await box.delete(key);
    await box.flush();
  }

  Future<void> deleteAll() async {
    final box = await Hive.openBox<T>(boxName);
    await box.clear();
    await box.flush();
  }
}
