import 'package:priorities/presentation/__components/centered_loading_indicator.dart';
import 'package:priorities/presentation/views/categories/categories_view_model.dart';
import 'package:priorities/presentation/__components/horizon_button.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class CategoriesList extends ViewModelWidget<CategroiesViewModel> {
  const CategoriesList({super.key});

  @override
  Widget build(BuildContext context, viewModel) {
    final categories = viewModel.categories;
    return viewModel.isBusy
        ? const CenteredLoadingIndicator()
        : ListView.builder(
            itemCount: categories.length,
            physics: const AlwaysScrollableScrollPhysics(
              parent: BouncingScrollPhysics(),
            ),
            itemBuilder: (context, index) {
              final category = categories[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: HorizonButton(
                  onPressed: () => viewModel.onCategorySelected(category),
                  text: category.title,
                  width: double.infinity,
                ),
              );
            },
          );
  }
}
