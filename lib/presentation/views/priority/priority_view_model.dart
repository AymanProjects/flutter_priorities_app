import 'package:priorities/data/repositories/categories_repo.dart';
import 'package:priorities/data/repositories/priorities_repo.dart';
import 'package:priorities/data/models/category.dart';
import 'package:priorities/data/models/priority.dart';
import 'package:priorities/services/app_router.dart';
import 'package:priorities/data/models/task.dart';
import 'package:priorities/injection.dart';
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

//  Logic code only

class PriorityViewModel extends BaseViewModel {
  Priority? priority;
  final selectedCategories = <Category>[];
  final tasks = <Task>[];
  final emojiController = TextEditingController();
  final titleController = TextEditingController();
  int selectedColor = Priority.defaultColorId;

  PriorityViewModel([this.priority]);

  bool get editingMode => priority != null;

  String get title => editingMode ? 'Edit' : 'New';

  String get buttonText => editingMode ? 'Confirm' : 'Create';

  void createOrUpdatePriority() async {
    // Start loading
    setBusy(true);

    // Creaet a new Priority
    Priority priority = Priority(
      colorId: selectedColor,
      categories: selectedCategories,
    );

    // Assign this Priority to the default Categories
    final defaultCategories =
        await locator<CategoriesRepository>().allDefaultCategories();
    priority.categories?.addAll(defaultCategories);

    // Store the Priority
    await locator<PrioritiesRepository>().updateOrCreate(priority);

    // Stop loading
    setBusy(false);

    // Back to previous page
    locator<AppRouter>().closeCurrentPage();
  }
}
