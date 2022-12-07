import 'package:priorities/domain/data/repository.dart';
import 'package:priorities/data/models/category.dart';
import 'package:priorities/data/models/priority.dart';

abstract class IPrioritiesRepo implements IRepository<Priority> {
  const IPrioritiesRepo();

  Future<List<Priority>> prioritiesOf(Category category);
}
