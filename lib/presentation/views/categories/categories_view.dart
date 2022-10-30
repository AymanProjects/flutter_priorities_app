import 'package:priorities/data/constants/theme.dart';
import 'package:priorities/data/constants/ui_constants.dart';
import 'package:priorities/presentation/__components/horizon_button.dart';
import 'package:priorities/presentation/__components/horizon_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:priorities/presentation/views/categories/categories_view_model.dart';
import 'package:stacked/stacked.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CategroiesViewModel>.reactive(
      viewModelBuilder: () => CategroiesViewModel(),
      builder: (context, viewModel, child) {
        return Padding(
          padding: const EdgeInsets.all(kLgPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  HorizonIconButton(
                    onPressed: Navigator.of(context).pop,
                    icon: Icons.close_sharp,
                  ),
                  const Text(
                    'Categories',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  HorizonIconButton(
                    onPressed: Navigator.of(context).pop,
                    icon: Icons.add_rounded,
                  ),
                ],
              ),
              const SizedBox(height: kLgPadding),
              //TODO
              Expanded(
                child: ListView.builder(
                  itemCount: viewModel.categories.length,
                  itemBuilder: (context, index) {
                    final category = viewModel.categories[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: HorizonButton(
                        onPressed: () =>
                            viewModel.setSelectedCategory(category),
                        text: category.title,
                        borderColor:
                            viewModel.selectedCategory.id == category.id
                                ? null
                                : kAppColor,
                        color: viewModel.selectedCategory.id == category.id
                            ? null
                            : Colors.white,
                        width: double.infinity,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
