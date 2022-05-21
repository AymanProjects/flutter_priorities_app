import 'package:flutter/material.dart';
import 'package:priorities/utils/constants.dart';
import 'package:priorities/views/home/components/new_priority_button.dart';
import 'package:priorities/views/home/components/priorities_grid.dart';
import 'package:priorities/views/home/components/home_view_title.dart';
import 'package:priorities/views/home/home_view_model.dart';
import 'package:stacked/stacked.dart';

//  UI code only

class HomeView extends StatelessWidget {
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
            top: kLgPadding * 2,
          ),
          child: Scaffold(
            floatingActionButton: const NewPriorityButton(),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HomeViewTitle(),
                const SizedBox(height: kLgPadding),
                //TODO
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const [
                    Text(
                      'Recent',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: kAppColor,
                      ),
                    ),
                    Spacer(),
                    Icon(Icons.settings_rounded),
                    SizedBox(width: kSmPadding),
                    Icon(Icons.menu_rounded),
                  ],
                ),
                const SizedBox(height: kSmPadding),
                // TODO
                const PrioritiesGrid(blocksAspectRatio: kSmBlockAspectRatio),
              ],
            ),
          ),
        );
      },
    );
  }
}
