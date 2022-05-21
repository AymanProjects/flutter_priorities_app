import 'package:flutter/material.dart';
import 'package:priorities/models/priority.dart';
import 'package:priorities/services/sql_db.dart';
import 'package:priorities/views/priority/priority_view.dart';
import 'package:stacked/stacked.dart';

//  Logic code only

class HomeViewModel extends BaseViewModel {
  List<Priority> get priorities => SQLDB().priorities;

  void createNewPriority(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const PriorityView(),
      ),
    );
  }
}
