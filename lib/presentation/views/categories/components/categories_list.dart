import 'package:priorities/presentation/views/categories/providers/categories_provider.dart';
import 'package:priorities/presentation/__components/centered_loading_indicator.dart';
import 'package:priorities/presentation/views/categories/categories_view_model.dart';
import 'package:priorities/presentation/__components/horizon_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class CategoriesList extends ConsumerWidget {
  const CategoriesList({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final viewModel = ref.read(categroiesViewModelProvider);
    final categories = ref.watch(categoriesProvider);
    return categories.when(
      skipError: true,
      loading: () => const CenteredLoadingIndicator(),
      error: (error, stackTrace) => const SizedBox(),
      data: (categories) {
        return ListView.builder(
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
      },
    );
  }
}
