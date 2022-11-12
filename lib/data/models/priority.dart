import 'package:priorities/data/constants/ui_constants.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class Priority {
  final int? id;
  final String emoji;
  final String title;
  final int colorId;
  final List<int> categoryIDs;
  final List<int> taskIDs;

  const Priority({
    required this.id,
    required this.emoji,
    required this.title,
    required this.colorId,
    required this.categoryIDs,
    required this.taskIDs,
  });

  Color get color => kCardColors[colorId];

  Priority copyWith({
    int? id,
    String? emoji,
    String? title,
    int? colorId,
    List<int>? categoryIDs,
    List<int>? taskIDs,
  }) {
    return Priority(
      id: id ?? this.id,
      emoji: emoji ?? this.emoji,
      title: title ?? this.title,
      colorId: colorId ?? this.colorId,
      categoryIDs: categoryIDs ?? this.categoryIDs,
      taskIDs: taskIDs ?? this.taskIDs,
    );
  }

  factory Priority.fromMap(Map<String, dynamic> map) {
    return Priority(
      id: map['id'] as int?,
      emoji: map['emoji'] as String? ?? '📔',
      title: map['title'] as String? ?? 'New',
      colorId: map['colorId'] as int? ?? 0,
      categoryIDs: List<int>.from(map['categoryIDs'] ?? []),
      taskIDs: List<int>.from(map['taskIDs'] ?? []),
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'emoji': emoji,
      'title': title,
      'colorId': colorId,
      'categoryIDs': categoryIDs,
      'taskIDs': taskIDs,
    };
  }

  String toJson() => json.encode(toMap());

  factory Priority.fromJson(String source) =>
      Priority.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Priority(id: $id, emoji: $emoji, title: $title, colorId: $colorId, categoryIDs: $categoryIDs, taskIDs: $taskIDs)';
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
        categoryIDs.hashCode ^
        taskIDs.hashCode;
  }
}
