import 'package:priorities/presentation/views/priority/providers/group_focus_node_provider.dart';
import 'package:priorities/presentation/views/priority/providers/currently_viewed_priority.dart';
import 'package:priorities/presentation/views/priority/components/task_item.dart';
import 'package:priorities/presentation/__components/horizon_icon_button.dart';
import 'package:priorities/presentation/__components/medium_padding.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:priorities/data/constants/theme.dart';
import 'package:priorities/data/models/task.dart';
import 'package:flutter/material.dart';
import 'package:priorities/presentation/views/priority/providers/scroll_controller.dart';

class TasksList extends ConsumerStatefulWidget {
  const TasksList({super.key});

  @override
  ConsumerState<TasksList> createState() => _TasksListState();
}

class _TasksListState extends ConsumerState<TasksList> {
  @override
  Widget build(BuildContext context) {
    final tasks = ref.watch(currentlyViewedPriority.select(
          (value) => value.valueOrNull?.tasks,
        )) ??
        [];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Tasks',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const MediumPadding(),
        for (Task task in tasks) ...[
          if (tasks.isNotEmpty) ...{
            TaskItem(
              task,
              focusNode: null,
            ),
            const MediumPadding(),
          }
        ],
        HorizonThinButton(
          onPressed: () => onAddTaskPressed(ref),
          text: 'Add',
          icon: Icons.add_rounded,
          iconSize: 20.0,
          height: 28.0,
          iconColor: kAppColor,
        ),
      ],
    );
  }

  void onAddTaskPressed(WidgetRef ref) {
    ref.read(currentlyViewedPriority.notifier).updateState(
          (priority) => priority.copyWith(tasks: [
            ...priority.tasks,
            Task(
              id: null,
              title: '',
              isCompleted: false,
              priority: priority,
            ),
          ]),
        );
    // request focus in the next frame, to avoid request before the rebuild is completed
    // and scroll the view to it.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final scroller = ref.read(priorityViewScrollContoller);
      scroller.animateTo(
        scroller.position.minScrollExtent,
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
      ref.read(priorityViewGroupFocusNode).children.last.requestFocus();
    });
  }
}
