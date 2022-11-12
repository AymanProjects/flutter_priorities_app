import 'package:priorities/presentation/views/categories/categories_view_model.dart';
import 'package:priorities/presentation/__components/horizon_icon_button.dart';
import 'package:priorities/data/constants/theme.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class CategoriesViewHeader extends ViewModelWidget<CategroiesViewModel> {
  const CategoriesViewHeader({super.key});

  @override
  bool get reactive => false;

  @override
  Widget build(BuildContext context, viewModel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        HorizonThinButton(
          onPressed: viewModel.onClosePage,
          icon: Icons.close_sharp,
        ),
        const Text(
          'Categories',
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        HorizonThinButton(
          onPressed: () => viewModel.createCategory(context),
          icon: Icons.add_rounded,
          iconColor: kAppColor,
        ),
      ],
    );
  }
}
