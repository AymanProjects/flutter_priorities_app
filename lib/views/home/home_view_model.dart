import 'package:flutter/material.dart';
import 'package:priorities/models/priority.dart';
import 'package:priorities/services/sql_db.dart';
import 'package:priorities/utils/constants.dart';
import 'package:priorities/views/home/components/categories_sheet.dart';
import 'package:priorities/views/priority/priority_view.dart';
import 'package:stacked/stacked.dart';

//  Logic code only

class HomeViewModel extends BaseViewModel {
  double gridBlocksSize = kLgBlockAspectRatio;
  List<Priority> get priorities => SQLDB().priorities;

  bool get hasPriorities => priorities.isNotEmpty;

//TODO
  void createNewPriority(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const PriorityView(),
      ),
    );
  }

  void categoriesViewButtonOnTap(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => const CategoriesSheet(),
    );
  }

  void optionsViewButtonOnTap() {}

  void gridBlockSizeButtonOnTap() {
    notifyListeners();
  }
}
