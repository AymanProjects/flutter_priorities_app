import 'package:priorities/data/sources/sqflite/tables/categories_table.dart';
import 'package:priorities/data/sources/sqflite/tables/priorities_table.dart';
import 'package:priorities/data/sources/sqflite/tables/tasks_table.dart';
import 'package:priorities/domain/base/base_data_source.dart';
import 'package:priorities/domain/base/base_entity.dart';
import 'package:sqflite/sqflite.dart';

class SqfilteDataSource<T extends BaseEntity> extends BaseDataSource<T> {
  static Database? _database;
  final String tableName;
  final Map<String, Object?> Function(T) toMap;
  final T Function(Map<String, Object?>) fromMap;

  const SqfilteDataSource({
    required this.tableName,
    required this.toMap,
    required this.fromMap,
  });

  static Future<void> init() async {
    _database = await SqfliteInit.init();
  }

  @override
  Future<void> create(T entity) async {
    await _database?.insert(
      tableName,
      toMap(entity),
    );
  }

  Future<void> createMany(List<T> entities) async {
    //TODO batch
    await _database?.insert(
      tableName,
      row,
    );
  }

  @override
  Future<List<T>> all() async {
    final data = await _database?.query(tableName);
    return data?.map((item) => fromMap(item)).toList() ?? [];
  }

  @override
  Future<T> find(int id) async {
    final data = await _database?.query(
      tableName,
      where: '$id = ?',
      whereArgs: [id],
    );

    return results.first;
  }

  @override
  Future<int> update(Map<String, dynamic> row) async {
    return db.update(
      tableName,
      row,
      where: '$columnId = ?',
      whereArgs: [row[columnId]],
    );
  }

  @override
  Future<int> delete(int id) async {
    return db.delete(tableName, where: '$columnId = ?', whereArgs: [id]);
  }
}

class SqfliteInit {
  static const _dbName = 'prioritiesDB.db';
  static const _dbVersion = 1;

  static Future<Database> init() async {
    return await openDatabase(
      _dbName,
      version: _dbVersion,
      onCreate: _onCreate,
      onConfigure: _onConfigure,
    );
  }

  static Future<void> _onCreate(Database db, int version) async {
    await TasksTable.create(db);
    await PrioritiesTable.createTable(db);
    await CategoriesTable.create(db);
  }

  static Future<void> _onConfigure(Database db) async {
    await db.execute('PRAGMA foreign_keys = ON');
  }
}
