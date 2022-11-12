import 'package:priorities/data/repositories/categories_repo.dart';
import 'package:priorities/services/app_notifier.dart';
import 'package:priorities/data/models/category.dart';
import 'package:priorities/services/app_router.dart';
import 'package:priorities/injection.dart';
import 'package:stacked/stacked.dart';

class CategroiesViewModel extends BaseViewModel {
  List<Category> categories = [];

  void init() {
    _loadCategories();
  }

  Future<void> _loadCategories() async {
    runBusyFuture<void>(
      Future(() async {
        categories = await locator<CategoriesRepository>().all();
      }),
    ).catchError((error) => locator<AppNotifier>().showError(error.toString()));
  }

  void onCategorySelected(Category category) {
    locator<AppRouter>().closeCurrentPage(category);
  }

  void createCategory(context) async {
    // Get name from user via textfield
    final result = await locator<AppRouter>().openTextFieldDialog(
      'Enter Category Name',
      'New Category',
    );
    // if dismissed
    if (result == null) {
      return;
    }
    // create a new category
    final category = Category(
      title: result,
      isDefault: false,
    );
    // save the category & reload
    runBusyFuture<void>(Future<Category>(() {
      return locator<CategoriesRepository>().updateOrCreate(category);
    }))
        .then((value) => _loadCategories())
        .catchError((error) => locator<AppNotifier>().showError(error));
  }

  void onClosePage() {
    locator<AppRouter>().closeCurrentPage();
  }
}
