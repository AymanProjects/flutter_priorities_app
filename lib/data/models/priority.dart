import 'package:priorities/data/constants/ui_constants.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:priorities/data/models/category.dart';
import 'package:priorities/data/models/task.dart';
import 'package:flutter/material.dart';

part 'priority.freezed.dart';
part 'priority.g.dart';

@freezed
class Priority with _$Priority {
  const Priority._();

  @JsonSerializable(explicitToJson: true)
  const factory Priority({
    required int? id,
    required String emoji,
    required String title,
    required int colorId,
    required List<Category> categories,
    required List<Task> tasks,
  }) = _Priority;

  Color get color => kCardColors[colorId];

  factory Priority.fromJson(Map<String, Object?> json) =>
      _$PriorityFromJson(json);
}
