import 'package:priorities/presentation/views/categories/providers/categories_provider.dart';
import 'package:priorities/presentation/__components/horizon_icon_button.dart';
import 'package:priorities/providers/service_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:priorities/data/constants/theme.dart';
import 'package:priorities/data/models/category.dart';
import 'package:flutter/material.dart';

class CategoriesViewHeader extends ConsumerWidget {
  const CategoriesViewHeader({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        HorizonThinButton(
          onPressed: () => onClosePagePressed(ref),
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
          onPressed: () => onCreateCategoryPressed(ref),
          icon: Icons.add_rounded,
          iconColor: kAppColor,
        ),
      ],
    );
  }

  void onCreateCategoryPressed(WidgetRef ref) async {
    // Get name from user via textfield
    final navigation = ref.read(navigationServiceProvider);
    final result = await navigation.openTextFieldDialog(
      'Enter Category Name',
      'New Category',
    );
    // if dismissed
    if (result == null) {
      return;
    }
    // create a new category
    final category = Category(
      id: null,
      title: result,
      isDefault: false,
    );
    return ref
        .read(categoriesProvider.notifier)
        .createOrUpdateCategory(category);
  }

  void onClosePagePressed(WidgetRef ref) {
    ref.read(navigationServiceProvider).closeCurrentPage();
  }
}
