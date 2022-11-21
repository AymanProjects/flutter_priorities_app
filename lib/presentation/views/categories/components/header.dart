import 'package:priorities/presentation/views/categories/categories_view_model.dart';
import 'package:priorities/presentation/__components/horizon_icon_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:priorities/data/constants/theme.dart';
import 'package:flutter/material.dart';

class CategoriesViewHeader extends ConsumerWidget {
  final CategroiesViewModel viewModel;
  const CategoriesViewHeader(this.viewModel, {super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        HorizonThinButton(
          onPressed: viewModel.onClosePagePressed,
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
          onPressed: () => viewModel.onCreateCategoryPressed(ref),
          icon: Icons.add_rounded,
          iconColor: kAppColor,
        ),
      ],
    );
  }
}
