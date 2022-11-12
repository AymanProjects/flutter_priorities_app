import 'package:priorities/presentation/__components/horizon_icon_button.dart';
import 'package:priorities/presentation/views/home/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class SelectedCategoryButton extends ViewModelWidget<HomeViewModel> {
  const SelectedCategoryButton({super.key});

  @override
  Widget build(BuildContext context, viewModel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        viewModel.selectedCategory == null
            ? const SizedBox()
            : HorizonThinButton(
                onPressed: viewModel.selectedCategoryButtonOnTap,
                icon: Icons.filter_list_rounded,
                text: viewModel.selectedCategory?.title,
              ),
      ],
    );
  }
}
