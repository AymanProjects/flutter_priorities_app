import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:priorities/data/models/task.dart';
import 'package:flutter/material.dart';

class BlockProgress extends ConsumerWidget {
  final List<Task>? tasks;
  const BlockProgress(this.tasks, {super.key});

  @override
  Widget build(BuildContext context, ref) {
    return SizedBox(
      height: 20,
      width: 20,
      child: CircularProgressIndicator(
        backgroundColor: Colors.white.withOpacity(0.3),
        valueColor: const AlwaysStoppedAnimation(Colors.white),
        value: progress(),
        strokeWidth: 3.0,
      ),
    );
  }

  double progress() {
    if (tasks == null || tasks!.isEmpty) {
      return 0.0;
    }
    return completedTasks() / tasks!.length;
  }

  int completedTasks() {
    if (tasks == null) return 0;
    return tasks!.where((task) => task.isCompleted).length;
  }
}
