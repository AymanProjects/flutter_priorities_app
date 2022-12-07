import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:priorities/data/models/priority.dart';

part 'task.freezed.dart';
part 'task.g.dart';

@freezed
class Task with _$Task {
  @JsonSerializable(explicitToJson: true)
  const factory Task({
    required int? id,
    required String title,
    required bool isCompleted,
    required Priority priority,
  }) = _Task;

  factory Task.fromJson(Map<String, Object?> json) => _$TaskFromJson(json);
}
