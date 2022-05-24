import 'package:flutter/material.dart';
import 'package:priorities/utils/constants.dart';
import 'package:priorities/views/components/horizon_icon_button.dart';
import 'package:priorities/views/home/home_view_model.dart';
import 'package:stacked/stacked.dart';

class CategoriesViewButton extends ViewModelWidget<HomeViewModel> {
  const CategoriesViewButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, viewModel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //TODO
        const Text(
          'Recent',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.black54,
            fontSize: 14.0,
          ),
        ),
        HorizonIconButton(
          onTap: () => viewModel.categoriesViewButtonOnTap(context),
          icon: Icons.filter_list_rounded,
          iconColor: kAppColor,
          iconSize: 24.0,
        ),
      ],
    );
  }
}
