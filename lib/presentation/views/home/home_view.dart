import 'package:flutter/material.dart';
import 'package:priorities/data/constants/ui_constants.dart';
import 'package:priorities/presentation/__components/view.dart';
import 'package:priorities/presentation/views/home/components/create_priority_button.dart';
import 'package:priorities/presentation/views/home/components/options_button.dart';
import 'package:priorities/presentation/views/home/components/priorities_grid.dart';
import 'package:priorities/presentation/views/home/components/selected_category.dart';
import 'package:priorities/presentation/views/home/home_view_model.dart';
import 'package:stacked/stacked.dart';

//  UI code only

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, viewModel, child) {
        return const View(
          title: 'Your Priorities',
          hasBackButton: false,
          trailing: OptionsButton(),
          children: [
            SelectedCategory(),
            SizedBox(height: kSmPadding),
            Expanded(
              child: PrioritiesGrid(),
            ),
            SizedBox(height: kSmPadding),
            CreatePriorityButton(),
            SizedBox(height: kLgPadding),
          ],
        );
      },
    );
  }
}
