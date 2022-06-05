import 'package:flutter/material.dart';
import 'package:priorities/utils/constants.dart';
import 'package:priorities/views/__components/horizon_button.dart';
import 'package:priorities/views/__components/horizon_icon_button.dart';
import 'package:priorities/views/categories/categories_view_model.dart';
import 'package:stacked/stacked.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({Key? key}) : super(key: key);

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
                    onTap: Navigator.of(context).pop,
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
                    onTap: Navigator.of(context).pop,
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
                        onTap: () => viewModel.setSelectedCategory(category),
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
