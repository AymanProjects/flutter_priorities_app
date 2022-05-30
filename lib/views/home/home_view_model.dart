import 'package:flutter/material.dart';
import 'package:priorities/data/repos/priorities_repo.dart';
import 'package:priorities/domain/entities/category.dart';
import 'package:priorities/domain/entities/priority.dart';
import 'package:priorities/services/router.dart';
import 'package:priorities/utils/constants.dart';
import 'package:priorities/views/categories/categories_view.dart';
import 'package:priorities/views/priority/priority_view.dart';
import 'package:stacked/stacked.dart';

//  Logic code only

class HomeViewModel extends BaseViewModel {
  final router = AppRouter();
  double gridBlocksSize = kLgBlockAspectRatio;

  //TODO
  Category get selectedCategory => Category(name: 'Recent');

  Future<List<Priority>> get loadPriorities async => PrioritiesRepo().all();

  void createNewPriority(BuildContext context) {
    router.open(const PriorityView());
  }

  void categoriesViewButtonOnTap(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => const CategoriesView(),
    );
  }

  //TODO
  void optionsViewButtonOnTap() {}

  //TODO move to settings viewmodel
  void gridBlockSizeButtonOnTap() {
    notifyListeners();
  }
}
