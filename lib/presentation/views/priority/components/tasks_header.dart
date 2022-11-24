import 'package:priorities/presentation/__components/horizon_icon_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:priorities/data/constants/theme.dart';
import 'package:flutter/material.dart';

class TasksHeader extends ConsumerWidget {
  const TasksHeader({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Tasks',
          style: TextStyle(color: kAppColor, fontSize: 18.0),
        ),
        HorizonThinButton(
          onPressed: () {},
          text: 'Add Task',
          icon: Icons.add_rounded,
          textSize: 20.0,
          iconColor: kAppColor,
        ),
      ],
    );
  }
}
