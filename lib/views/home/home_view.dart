import 'package:flutter/material.dart';
import 'package:priorities/domain/base/view.dart';
import 'package:priorities/utils/constants.dart';
import 'package:priorities/views/home/components/create_priority_button.dart';
import 'package:priorities/views/home/components/options_button.dart';
import 'package:priorities/views/home/components/categories_view_button.dart';
import 'package:priorities/views/home/components/priorities_grid.dart';
import 'package:priorities/views/home/components/selected_category_title.dart';
import 'package:priorities/views/home/components/title.dart';
import 'package:priorities/views/home/home_view_model.dart';
import 'package:stacked/stacked.dart';

//  UI code only

class HomeView extends View {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, viewModel, child) {
        return Padding(
          padding: const EdgeInsets.only(
            left: kLgPadding,
            right: kLgPadding,
            bottom: kLgPadding,
            top: kLgPadding * 2,
          ),
          child: Scaffold(
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const OptionsViewButton(),
                const HomeViewTitle(),
                const SizedBox(height: kLgPadding),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const [
                    SelectedCategoryTitle(),
                    CategoriesViewButton(),
                  ],
                ),
                const SizedBox(height: kSmPadding),
                const Expanded(
                  child: PrioritiesGrid(),
                ),
                const SizedBox(height: kSmPadding),
                const CreatePriorityButton(),
              ],
            ),
          ),
        );
      },
    );
  }
}
