import 'package:flutter/material.dart';
import 'package:objectbox/objectbox.dart';
import 'package:priorities/domain/base/base_entity.dart';
import 'package:priorities/domain/entities/category.dart';
import 'package:priorities/domain/entities/task.dart';
import 'package:priorities/utils/constants.dart';

@Entity()
class Priority extends BaseEntity {
  int id = 0;
  String emoji;
  String title;
  int colorId;

  final category = ToOne<Category>();

  final tasks = ToMany<Task>();

  Priority({
    required this.emoji,
    required this.title,
    required this.colorId,
  });

  Color get color => cardColors[colorId];

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
