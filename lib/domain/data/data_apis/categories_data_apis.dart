import 'package:priorities/data/models/category.dart';
import 'package:priorities/domain/data/crud.dart';

typedef T = Category;

abstract class CategoriesDataAPIS implements CRUD<T> {
  const CategoriesDataAPIS();

  Future<void> initDefaultValues();
  Future<List<T>> allDefaultCategories();
}
