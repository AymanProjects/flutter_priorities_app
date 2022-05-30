import 'package:flutter/material.dart';
import 'package:priorities/views/home/components/categories_view_button.dart';
import 'package:priorities/views/home/components/selected_category_title.dart';

class SelectedCategory extends StatelessWidget {
  const SelectedCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: const [
        SelectedCategoryTitle(),
        CategoriesViewButton(),
      ],
    );
  }
}
