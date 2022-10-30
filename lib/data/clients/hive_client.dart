import 'package:path_provider/path_provider.dart';
import 'package:hive/hive.dart';

/// A helper class for wrapping the 3rd-party Hive package

class HiveStorageClient {
  final String boxName;

  const HiveStorageClient({required this.boxName});

  static Future init() async {
    Hive.init((await getApplicationDocumentsDirectory()).path);
  }

  Future<String> generateID() async {
    final box = await Hive.openBox(boxName);
    return (box.length + 1).toString();
  }

  Future<dynamic> read({
    required String key,
  }) async {
    final box = await Hive.openBox(boxName);
    return box.get(key);
  }

  Future<List<dynamic>> readAll() async {
    final box = await Hive.openBox(boxName);
    return box.values.toList();
  }

  Future<bool> valueExists({
    required String key,
  }) async {
    final box = await Hive.openBox(boxName);
    return box.keys.contains(key);
  }

  Future<void> write({
    required String key,
    required dynamic value,
  }) async {
    final box = await Hive.openBox(boxName);
    return box.put(key, value);
  }

  Future<void> writeMany({
    required Map<dynamic, dynamic> entries,
  }) async {
    final box = await Hive.openBox(boxName);
    return box.putAll(entries);
  }

  Future<void> delete({
    required String key,
  }) async {
    final box = await Hive.openBox(boxName);
    return box.delete(key);
  }

  Future<void> deleteAll() async {
    final box = await Hive.openBox(boxName);
    return box.deleteFromDisk();
  }
}
