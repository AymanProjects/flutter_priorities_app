import 'package:priorities/data/repos/categories_repo.dart';
import 'package:priorities/data/sources/sqflite/sqflite_data_source.dart';
import 'package:priorities/domain/entities/category.dart';

Future init() async {
  await _initDataSources();

  /// Defualt category "All"
  await CategoriesRepo().create(Category.all());
}

Future _initDataSources() async {
  await SqfilteDataSource.init();
}
