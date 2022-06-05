import 'package:flutter/material.dart';
import 'package:priorities/domain/base/base_entity.dart';
import 'package:priorities/domain/entities/category.dart';
import 'package:priorities/domain/entities/task.dart';
import 'package:priorities/utils/constants.dart';

class Priority extends BaseEntity {
  String emoji;
  String title;
  int colorId;
  List<Category> categories;
  List<Task> tasks;

  Priority({
    this.emoji = '🕐',
    this.title = 'Untitled',
    this.colorId = 0,
    this.categories = const [],
    this.tasks = const [],
  });

  Color get color => cardColors[colorId];

  double get progress {
    if (tasks.isEmpty) return 0;
    return completedTasks() / tasks.length;
  }

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
