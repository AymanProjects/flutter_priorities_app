import 'package:priorities/domain/base/base_entity.dart';
import 'package:priorities/domain/base/base_data_source.dart';

/// All repositories must extend this class,
/// and override to assign the data sources.

abstract class BaseRepo<T extends BaseEntity> implements BaseDataSource<T> {
  final BaseDataSource<T> localDataSource;
  final BaseDataSource<T> remoteDataSource;

  const BaseRepo({
    required this.localDataSource,
    required this.remoteDataSource,
  });
}
