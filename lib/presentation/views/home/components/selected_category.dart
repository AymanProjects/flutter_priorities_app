import 'package:flutter/material.dart';
import 'package:priorities/presentation/__components/horizon_icon_button.dart';
import 'package:priorities/presentation/views/home/home_view_model.dart';
import 'package:stacked/stacked.dart';

class SelectedCategory extends ViewModelWidget<HomeViewModel> {
  const SelectedCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, viewModel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        HorizonIconButton(
          onPressed: () => viewModel.categoriesViewButtonOnTap(context),
          icon: Icons.filter_list_rounded,
          text: viewModel.selectedCategory.title,
        ),
      ],
    );
  }
}
