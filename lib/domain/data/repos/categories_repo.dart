import 'package:priorities/domain/data/repository.dart';
import 'package:priorities/data/models/category.dart';

abstract class ICategoriesRepo implements IRepository<Category> {
  const ICategoriesRepo();

  Future<void> initDefaultValues();
  Future<List<Category>> allDefaultCategories();
}
