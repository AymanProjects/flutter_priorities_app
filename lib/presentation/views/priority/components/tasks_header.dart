import 'package:priorities/data/constants/theme.dart';
import 'package:priorities/presentation/views/priority/priority_view_model.dart';
import 'package:priorities/presentation/__components/horizon_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class TasksHeader extends ViewModelWidget<PriorityViewModel> {
  const TasksHeader({super.key});

  @override
  Widget build(BuildContext context, viewModel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Tasks',
          style: TextStyle(color: kAppColor, fontSize: 18.0),
        ),
        HorizonThinButton(
          onPressed: () {},
          // text: 'Add Task',
          icon: Icons.add_rounded,
          textSize: 20.0,
          iconColor: kAppColor,
        ),
      ],
    );
  }
}
