import 'package:flutter/material.dart';
import 'package:priorities/models/priority.dart';
import 'package:priorities/models/task.dart';

class SQLDB {
  static SQLDB instance = SQLDB._();

  SQLDB._();
  factory SQLDB() => instance;

// TODO
  List<Priority> priorities = [
    Priority(
      emoji: '🍕',
      title: 'Buy Pizza Ingredaints',
      color: Colors.indigoAccent,
      tasks: [
        Task(title: 'Cheeese eeeeeeeeeeeeeeee', isCompleted: false),
        Task(title: 'Flour', isCompleted: true),
        Task(title: 'Tomato', isCompleted: true),
        Task(title: 'Olive Oil', isCompleted: true),
        Task(title: 'Salt', isCompleted: true),
        Task(title: 'Black Pepper', isCompleted: false),
      ],
    ),
    Priority(
      emoji: '🎁',
      title: 'Birthday Gift',
      color: Colors.redAccent,
      tasks: [
        Task(title: 'Buy A Gift', isCompleted: true),
        Task(title: 'Gift Wrapping', isCompleted: false),
        Task(title: 'Get Flowers', isCompleted: false),
      ],
    ),
    Priority(
      emoji: '🎨',
      title: 'Art Course',
      color: Colors.teal.shade400,
      tasks: [
        Task(title: 'Take a Friend', isCompleted: false),
        Task(title: 'Attend', isCompleted: false),
      ],
    ),
  ];

  // TODO
  void createPriority(Priority priority) {
    priorities.add(priority);
  }
}
