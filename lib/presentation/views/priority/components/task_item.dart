import 'package:priorities/presentation/views/priority/providers/currently_viewed_priority.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:priorities/data/models/task.dart';
import 'package:flutter/material.dart';

class TaskItem extends ConsumerWidget {
  final Task task;
  final FocusNode? focusNode;
  const TaskItem(
    this.task, {
    required this.focusNode,
    super.key,
  });

  @override
  Widget build(BuildContext context, ref) {
    return TextFormField(
      initialValue: task.title,
      focusNode: focusNode,
      onChanged: (title) => onTaskEdited(title, ref),
      decoration: const InputDecoration(
        border: InputBorder.none,
        filled: true,
      ),
    );
  }

  void onTaskEdited(String title, WidgetRef ref) {
    final updatedTask = task.copyWith(title: title);
    ref.read(currentlyViewedPriority.notifier).updateState(
          (priority) => priority.copyWith(
            tasks: priority.tasks.map(
              (task) {
                if (task == this.task) {
                  return updatedTask;
                } else {
                  return task;
                }
              },
            ).toList(),
          ),
        );
  }
}
