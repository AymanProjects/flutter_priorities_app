import 'package:priorities/data/models/priority.dart';
import 'package:priorities/domain/data/crud.dart';

typedef T = Priority;

abstract class PrioritiesDataAPIS implements CRUD<T> {
  const PrioritiesDataAPIS();
}
