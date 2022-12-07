import 'package:priorities/presentation/views/home/components/priorities_grid/priorities_grid.dart';
import 'package:priorities/presentation/views/home/components/selected_category_button.dart';
import 'package:priorities/presentation/views/home/components/create_priority_button.dart';
import 'package:priorities/presentation/views/home/components/options_button.dart';
import 'package:priorities/presentation/__components/large_padding.dart';
import 'package:priorities/presentation/__components/small_padding.dart';
import 'package:priorities/presentation/__components/view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const View(
      title: 'Your Priorities',
      hasBackButton: false,
      trailing: OptionsButton(),
      children: [
        SelectedCategoryButton(),
        SmallPadding(),
        Expanded(
          child: PrioritiesGrid(),
        ),
        SmallPadding(),
        CreatePriorityButton(),
        LargePadding(),
      ],
    );
  }
}
