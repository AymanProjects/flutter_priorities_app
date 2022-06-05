import 'package:flutter/cupertino.dart';
import 'package:priorities/data/repos/categories_repo.dart';
import 'package:priorities/data/repos/priorities_repo.dart';
import 'package:priorities/domain/entities/category.dart';
import 'package:priorities/domain/entities/priority.dart';
import 'package:priorities/domain/entities/task.dart';
import 'package:priorities/services/router.dart';
import 'package:stacked/stacked.dart';

//  Logic code only

class PriorityViewModel extends BaseViewModel {
  Priority? priority;
  final prioritiesRepo = PrioritiesRepo();
  final categoriesRepo = CategoriesRepo();
  final emojiController = TextEditingController();
  final titleController = TextEditingController();
  int? selectedColor;
  List<Category>? selectedCategories;
  List<Task>? tasks;

  PriorityViewModel([this.priority]);

  bool get editingMode => priority != null;

  String get title => editingMode ? 'Edit' : 'New';

  String get buttonText => editingMode ? 'Confirm' : 'Create';

  void createOrUpdatePriority() async {
    setBusy(true);

    // aka if creating a new priority
    if (!editingMode) {
      priority = Priority();
      // add it to the "All" category
      priority?.categories.add(Category.all());
    }
    priority?.emoji = emojiController.text;
    priority?.title = titleController.text;
    priority?.colorId = selectedColor ?? 0;
    priority?.categories.addAll(selectedCategories ?? []);
    priority?.tasks.addAll(tasks ?? []);
    await prioritiesRepo.create(priority!);

    AppRouter().close();
  }
}
