// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Category {
  final int? id;
  final String title;
  final bool isDefault;

  const Category({
    this.id,
    required this.title,
    required this.isDefault,
  });

  Category copyWith({
    int? id,
    String? title,
    bool? isDefault,
  }) {
    return Category(
      id: id ?? this.id,
      title: title ?? this.title,
      isDefault: isDefault ?? this.isDefault,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'isDefault': isDefault,
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id'] as int?,
      title: map['title'] as String? ?? 'Untitled',
      isDefault: map['isDefault'] as bool? ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory Category.fromJson(String source) =>
      Category.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Category(id: $id, title: $title, isDefault: $isDefault)';

  @override
  bool operator ==(covariant Category other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.isDefault == isDefault;
  }

  @override
  int get hashCode => id.hashCode ^ title.hashCode ^ isDefault.hashCode;
}
