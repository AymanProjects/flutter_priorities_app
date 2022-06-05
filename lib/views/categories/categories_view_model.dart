import 'package:priorities/domain/entities/category.dart';
import 'package:stacked/stacked.dart';

class CategroiesViewModel extends BaseViewModel {
  //TODO
  List<Category> get categories => [
        Category(title: 'New'),
        Category(title: 'Recent'),
        Category(title: 'Important'),
        Category(title: 'Down the list'),
      ];

  //TODO
  Category get selectedCategory => categories[1];

  //TODO
  void setSelectedCategory(Category category) {}
}
