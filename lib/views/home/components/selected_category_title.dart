import 'package:flutter/material.dart';
import 'package:priorities/views/home/home_view_model.dart';
import 'package:stacked/stacked.dart';

class SelectedCategoryTitle extends ViewModelWidget<HomeViewModel> {
  const SelectedCategoryTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, viewModel) {
    return Text(
      viewModel.selectedCategory.name,
      style: const TextStyle(
        fontWeight: FontWeight.w600,
        color: Colors.black54,
        fontSize: 14.0,
      ),
    );
  }
}
