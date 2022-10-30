// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:priorities/data/constants/ui_constants.dart';
import 'package:priorities/data/models/category.dart';
import 'package:priorities/data/models/task.dart';

class Priority {
  final String? id;
  final String? emoji;
  final String? title;
  final int? colorId;
  final List<Category>? categories;
  final List<Task>? tasks;

  static const defaultEmoji = '📃';
  static const defaultTitle = 'New';
  static const defaultColorId = 0;

  const Priority({
    this.id,
    this.emoji,
    this.title,
    this.colorId,
    this.categories,
    this.tasks,
  });

  Color get color => kCardColors[colorId ?? defaultColorId];

  double get progress {
    if (tasks == null || tasks!.isEmpty) {
      return 0.0;
    }
    return completedTasks() / tasks!.length;
  }

  int completedTasks() {
    int numOfCompletedTasks = 0;
    for (Task task in tasks ?? []) {
      if (task.isCompleted ?? false) {
        numOfCompletedTasks++;
      }
    }
    return numOfCompletedTasks;
  }

  Priority copyWith({
    String? id,
    String? emoji,
    String? title,
    int? colorId,
    List<Category>? categories,
    List<Task>? tasks,
  }) {
    return Priority(
      id: id ?? this.id,
      emoji: emoji ?? this.emoji,
      title: title ?? this.title,
      colorId: colorId ?? this.colorId,
      categories: categories ?? this.categories,
      tasks: tasks ?? this.tasks,
    );
  }

  factory Priority.fromMap(Map<String, dynamic> map) {
    return Priority(
      id: map['id'] != null ? map['id'] as String : null,
      emoji: map['emoji'] != null ? map['emoji'] as String : null,
      title: map['title'] != null ? map['title'] as String : null,
      colorId: map['colorId'] != null ? map['colorId'] as int : null,
      categories: map['categories'] != null
          ? List<Category>.from(
              (map['categories'] as List).map<Category?>(
                (x) => Category.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      tasks: map['tasks'] != null
          ? List<Task>.from(
              (map['tasks'] as List).map<Task?>(
                (x) => Task.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'emoji': emoji,
      'title': title,
      'colorId': colorId,
      'categories': categories?.map((x) => x.toMap()).toList(),
      'tasks': tasks?.map((x) => x.toMap()).toList(),
    };
  }

  String toJson() => json.encode(toMap());

  factory Priority.fromJson(String source) =>
      Priority.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Priority(id: $id, emoji: $emoji, title: $title, colorId: $colorId, categories: $categories, tasks: $tasks)';
  }

  @override
  bool operator ==(covariant Priority other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.emoji == emoji &&
        other.title == title &&
        other.colorId == colorId;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        emoji.hashCode ^
        title.hashCode ^
        colorId.hashCode ^
        categories.hashCode ^
        tasks.hashCode;
  }
}
