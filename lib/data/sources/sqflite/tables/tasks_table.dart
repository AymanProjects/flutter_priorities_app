import 'package:priorities/domain/base/base_table.dart';

abstract class TasksTable extends BaseSQLTable {
  @override
  String tableName = 'tasks';
  @override
  String idColumn = 'id';

  static const titleColumn = 'title';
  static const isCompletedColumn = 'is_completed';
  static const priorityIdColumn = 'priority_id';

  static Future<void> create() async {
    await db.execute('''
      CREATE TABLE $tableName (
      $idColumn INTEGER PRIMARY KEY AUTOINCREMENT,
      $titleColumn TEXT NOT NULL,
      $isCompletedColumn INTEGER NOT NULL,
      $priorityIdColumn INTEGER NOT NULL,
      FOREIGN KEY($priorityIdColumn) REFERENCES ${PrioritiesTable.tableName}(${PrioritiesTable.idColumn}) 
      ON UPDATE CASCADE
      ON DELETE CASCADE
      )
      ''');
  }
}
