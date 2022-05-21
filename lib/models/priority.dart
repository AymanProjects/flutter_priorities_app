import 'package:flutter/material.dart';
import 'package:priorities/models/task.dart';

class Priority {
  final String? id;
  final String emoji;
  final String title;
  final Color color;
  final List<Task> tasks;

  Priority({
    this.id,
    required this.emoji,
    required this.title,
    required this.color,
    required this.tasks,
  });

  double get progress => completedTasks() / tasks.length;

  int completedTasks() {
    int numOfCompletedTasks = 0;
    for (Task task in tasks) {
      if (task.isCompleted) {
        numOfCompletedTasks++;
      }
    }
    return numOfCompletedTasks;
  }
}
