import 'package:priorities/domain/data/data_source.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hive/hive.dart';
import 'dart:convert';

class HiveDataSource<T extends Object> implements IDataSource<T> {
  final T Function(Map<String, dynamic> json) fromJson;
  final Map<String, dynamic> Function(T object) toJson;
  final String boxName;

  // We will store all objects as String to avoid casting issues.
  // So all objects will be encoded using jsonEncode();
  Box<String>? _box;

  HiveDataSource({
    required this.fromJson,
    required this.toJson,
    required this.boxName,
  });

  static Future init() async {
    Hive.init((await getApplicationDocumentsDirectory()).path);
  }

  Future<Box<String>> getBox() async {
    return _box ??= await Hive.openBox<String>(boxName);
  }

  Future<int> _generateID() async {
    final box = await getBox();
    return box.length + 1;
  }

  @override
  Future<T> find(int id) async {
    final box = await getBox();
    final jsonAsString = box.get(id);
    if (jsonAsString == null) throw HiveError('Hive Error, object not found');
    return fromJson(jsonDecode(jsonAsString));
  }

  @override
  Future<List<T>> findMany(Set<int> ids) async {
    final box = await getBox();
    final values = box.values;
    final valuesDecoded = values.map((e) => jsonDecode(e)).toList();
    final resultJsons =
        valuesDecoded.where((json) => ids.contains(json['id'])).toList();
    return resultJsons.map((json) => fromJson(json)).toList();
  }

  @override
  Future<List<T>> all() async {
    final box = await getBox();
    final jsons = box.values;
    return jsons.map((json) => fromJson(jsonDecode(json))).toList();
  }

  Future<bool> valueExists({required int id}) async {
    final box = await getBox();
    return box.keys.contains(id);
  }

  @override
  Future<T> createOrUpdate(T object) async {
    final box = await getBox();
    final json = toJson(object);
    if (json['id'] == null) {
      json['id'] = await _generateID();
    }
    final jsonAsString = jsonEncode(json);
    await box.put(json['id'], jsonAsString);
    await box.flush();
    return fromJson(json);
  }

  @override
  Future<List<T>> createOrUpdateMany(List<T> objects) async {
    final box = await getBox();
    final jsons = objects.map((e) => toJson(e)).toList();
    for (var json in jsons) {
      if (json['id'] == null) json['id'] = await _generateID();
    }
    final entries = {
      for (var json in jsons) json['id']: jsonEncode(json),
    };
    await box.putAll(entries);
    await box.flush();
    return jsons.map((json) => fromJson(json)).toList();
  }

  @override
  Future<void> delete(int id) async {
    final box = await getBox();
    await box.delete(id);
    await box.flush();
  }

  @override
  Future<void> deleteAll() async {
    final box = await getBox();
    await box.clear();
    await box.flush();
  }

  @override
  Future<List<T>> where(Map<String, dynamic> query) {
    throw UnimplementedError();
  }
}
