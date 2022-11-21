import 'package:priorities/presentation/views/categories/categories_view_model.dart';
import 'package:priorities/presentation/views/categories/components/categories_list.dart';
import 'package:priorities/presentation/views/categories/components/header.dart';
import 'package:priorities/presentation/__components/large_padding.dart';
import 'package:priorities/data/constants/ui_constants.dart';
import 'package:flutter/material.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});
  final viewModel = const CategroiesViewModel();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kLgPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CategoriesViewHeader(viewModel),
          const LargePadding(),
          Expanded(
            child: CategoriesList(viewModel),
          ),
        ],
      ),
    );
  }
}
