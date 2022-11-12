// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Task {
  final int? id;
  final String content;
  final bool isCompleted;
  final int priorityID;

  Task({
    this.id,
    this.content = '',
    this.isCompleted = false,
    required this.priorityID,
  });

  Task copyWith({
    int? id,
    String? content,
    bool? isCompleted,
    int? priorityID,
  }) {
    return Task(
      id: id ?? this.id,
      content: content ?? this.content,
      isCompleted: isCompleted ?? this.isCompleted,
      priorityID: priorityID ?? this.priorityID,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'content': content,
      'isCompleted': isCompleted,
      'priorityID': priorityID,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'] != null ? map['id'] as int : null,
      content: map['content'] as String,
      isCompleted: map['isCompleted'] as bool,
      priorityID: map['priorityID'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Task.fromJson(String source) =>
      Task.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Task(id: $id, content: $content, isCompleted: $isCompleted, priorityID: $priorityID)';
  }

  @override
  bool operator ==(covariant Task other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.content == content &&
        other.isCompleted == isCompleted &&
        other.priorityID == priorityID;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        content.hashCode ^
        isCompleted.hashCode ^
        priorityID.hashCode;
  }
}
