import 'package:priorities/domain/base/base_table.dart';
import 'package:sqflite/sqflite.dart';

abstract class CategoriesTable extends BaseSQLTable {
  @override
  String tableName = 'categories';
  @override
  String idColumn = 'id';

  static const titleColumn = 'title';

  static Future<void> createTable() async {
    //TODO insert defult category "all"

    await db.execute('''
      CREATE TABLE $tableName (
      $columnId               INTEGER PRIMARY KEY AUTOINCREMENT,
      $columnProjectId        INTEGER NOT NULL,
      $columnConclusion       TEXT    NOT NULL)
      ''');
  }
}
