import 'package:priorities/presentation/views/categories/categories_view.dart';
import 'package:priorities/presentation/views/priority/priority_view.dart';
import 'package:priorities/data/repositories/priorities_repo.dart';
import 'package:priorities/data/constants/ui_constants.dart';
import 'package:priorities/data/models/priority.dart';
import 'package:priorities/data/models/category.dart';
import 'package:priorities/services/app_notifier.dart';
import 'package:priorities/services/app_router.dart';
import 'package:priorities/services/user_prefs.dart';
import 'package:priorities/injection.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  double gridBlocksSize = kLgBlockAspectRatio;
  List<Priority> priorities = [];
  Category? selectedCategory;

  void init() async {
    _loadPriorities();
  }

  Future<void> _changeSelectedCategory(Category category) async {
    await locator<UserPrefs>().updateLastSelectedCategory(category);
    selectedCategory = category;
    _loadPriorities();
  }

  Future<void> _loadPriorities() async {
    runBusyFuture<void>(
      Future(() async {
        selectedCategory ??= await locator<UserPrefs>().lastSelectedCategory();
        priorities =
            await locator<PrioritiesRepository>().allWithin(selectedCategory!);
        priorities.sort((a, b) => b.id!.compareTo(a.id!));
      }),
      busyObject: priorities,
    ).catchError((error) => locator<AppNotifier>().showError(error.toString()));
  }

  void createPriorityButtonOnTap() async {
    final result =
        await locator<AppRouter>().openPage<Priority>(const PriorityView(null));
    if (result != null) {
      _loadPriorities();
    }
  }

  void selectedCategoryButtonOnTap() async {
    final result =
        await locator<AppRouter>().openModal<Category?>(const CategoriesView());
    if (result != null) {
      await _changeSelectedCategory(result);
    }
  }

  void priorityBlockOnTap(Priority currentPriority) async {
    final updatedPriority = await locator<AppRouter>()
        .openPage<Priority>(PriorityView(currentPriority));
    if (updatedPriority != currentPriority) {
      _loadPriorities();
    }
  }
}
