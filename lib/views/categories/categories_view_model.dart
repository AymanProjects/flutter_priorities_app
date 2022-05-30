import 'package:priorities/domain/entities/category.dart';
import 'package:stacked/stacked.dart';

class CategroiesViewModel extends BaseViewModel {
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
