import 'package:priorities/domain/base/base_table.dart';

class PrioritiesTable extends BaseSQLTable {
  @override
  String tableName = 'priorities';
  @override
  String idColumn = 'id';

  static const emojiColumn = 'emoji';
  static const titleColumn = 'title';
  static const colorIdColumn = 'color_id';

  static PrioritiesTable? _this;
  factory PrioritiesTable() => _this ??= PrioritiesTable._();
  PrioritiesTable._();

  Future<void> createTableCommand() async {
    await db.execute('''
      CREATE TABLE $tableName (
      $columnId               INTEGER PRIMARY KEY AUTOINCREMENT,
      $columnProjectId        INTEGER NOT NULL,
      $columnConclusion       TEXT    NOT NULL)
      ''');
  }
}
