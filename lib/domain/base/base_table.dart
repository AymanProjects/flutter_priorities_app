import 'package:priorities/domain/base/base_entity.dart';

abstract class BaseSQLTable<T extends BaseEntity> {
  static const String tableIdcolumn;
  abstract final String tableName;
  abstract final String idColumn;
  String createTableCommand();
  /todo
  fromMap();
  ToMap(T entity);
}
