import 'package:priorities/data/models/category.dart';
import 'package:priorities/presentation/__components/centered_loading_indicator.dart';
import 'package:priorities/presentation/__components/horizon_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:priorities/presentation/views/categories/providers/categories_provider.dart';
import 'package:priorities/presentation/views/home/providers/selected_category_provider.dart';
import 'package:priorities/providers/service_providers.dart';

class CategoriesList extends ConsumerWidget {
  const CategoriesList({super.key});

  @override
  Widget build(BuildContext context, ref) {
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
                onPressed: () => onCategorySelected(category, ref),
                text: category.title,
                width: double.infinity,
              ),
            );
          },
        );
      },
    );
  }

  void onCategorySelected(Category category, WidgetRef ref) {
    ref
        .read(selectedCategoryProvider.notifier)
        .changeSelectedCategory(category);
    ref.read(navigationServiceProvider).closeCurrentPage();
  }
}
