import 'package:priorities/presentation/views/home/providers/selected_category_provider.dart';
import 'package:priorities/presentation/__components/horizon_icon_button.dart';
import 'package:priorities/presentation/views/home/home_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class SelectedCategoryButton extends ConsumerWidget {
  const SelectedCategoryButton({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final viewModel = ref.read(homeViewModelProvider);
    final selectedCategory = ref.watch(selectedCategoryProvider);
    return selectedCategory.when(
      skipError: true,
      loading: () => const SizedBox(),
      error: (error, stackTrace) => const SizedBox(),
      data: (category) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            HorizonThinButton(
              onPressed: viewModel.selectedCategoryButtonOnTap,
              icon: Icons.filter_list_rounded,
              text: category.title,
            ),
          ],
        );
      },
    );
  }
}
