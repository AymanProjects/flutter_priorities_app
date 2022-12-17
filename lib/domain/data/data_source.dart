import 'package:priorities/domain/data/crud.dart';

abstract class IDataSource<T extends Object> implements CRUD<T> {
  const IDataSource();
}
