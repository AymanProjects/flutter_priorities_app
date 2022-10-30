import 'package:flutter/material.dart';
import 'package:priorities/data/constants/ui_constants.dart';
import 'package:priorities/data/models/category.dart';
import 'package:priorities/data/models/priority.dart';
import 'package:priorities/data/repositories/priorities_repo.dart';
import 'package:priorities/injection.dart';
import 'package:priorities/presentation/views/categories/categories_view.dart';
import 'package:priorities/presentation/views/priority/priority_view.dart';
import 'package:priorities/services/app_router.dart';
import 'package:stacked/stacked.dart';

//  Logic code only

class HomeViewModel extends BaseViewModel {
  double gridBlocksSize = kLgBlockAspectRatio;

  //TODO
  Category get selectedCategory => const Category(title: 'Recent');

  Future<List<Priority>> loadPriorities() {
    return locator<PrioritiesRepository>().all();
  }

  void priorityButtonOnTap(BuildContext context) async {
    await locator<AppRouter>().openPage(const PriorityView());
    notifyListeners();
  }

  void categoriesViewButtonOnTap(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => const CategoriesView(),
    );
  }
}
