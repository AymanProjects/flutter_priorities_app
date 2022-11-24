import 'package:priorities/presentation/views/categories/providers/categories_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:priorities/data/models/category.dart';
import 'package:priorities/presentation/views/home/providers/selected_category_provider.dart';
import 'package:priorities/services/navigation_service.dart';
import 'package:priorities/injection.dart';

final categroiesViewModelProvider = Provider.autoDispose(
  (ref) => _CategroiesViewModel(ref),
);

class _CategroiesViewModel {
  final Ref ref;
  const _CategroiesViewModel(this.ref);

  void onCategorySelected(Category category) {
    ref
        .read(selectedCategoryProvider.notifier)
        .changeSelectedCategory(category);
    locator<NavigationService>().closeCurrentPage(category);
  }

  void onCreateCategoryPressed() async {
    // Get name from user via textfield
    final result = await locator<NavigationService>().openTextFieldDialog(
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
    return ref.read(categoriesProvider.notifier).createCategory(category);
  }

  void onClosePagePressed() {
    locator<NavigationService>().closeCurrentPage();
  }
}
