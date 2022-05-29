import 'package:flutter/material.dart';
import 'package:priorities/views/__components/horizon_icon_button.dart';
import 'package:priorities/views/home/home_view_model.dart';
import 'package:stacked/stacked.dart';

class CategoriesViewButton extends ViewModelWidget<HomeViewModel> {
  const CategoriesViewButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, viewModel) {
    return HorizonIconButton(
      onTap: () => viewModel.categoriesViewButtonOnTap(context),
      icon: Icons.filter_list_rounded,
      iconSize: 24.0,
    );
  }
}
