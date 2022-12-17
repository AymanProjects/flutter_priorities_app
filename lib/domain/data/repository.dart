import 'package:priorities/domain/data/crud.dart';
import 'package:priorities/domain/data/data_source.dart';

abstract class IRepository<T extends Object> implements CRUD<T> {
  final IDataSource<T> localSource;
  const IRepository({
    required this.localSource,
  });
}
