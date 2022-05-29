import 'package:priorities/domain/base/view_model.dart';
import 'package:priorities/domain/entities/category.dart';

class CategroiesViewModel extends ViewModel {
  //TODO
  List<Category> get categories => [
        Category(name: 'New'),
        Category(name: 'Recent'),
        Category(name: 'Important'),
        Category(name: 'Down the list'),
      ];

  //TODO
  Category get selectedCategory => categories[1];

  //TODO
  void setSelectedCategory(Category category) {}
}
