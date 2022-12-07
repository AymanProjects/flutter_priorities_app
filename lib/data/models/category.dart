import 'package:freezed_annotation/freezed_annotation.dart';

part 'category.freezed.dart';
part 'category.g.dart';

@freezed
class Category with _$Category {
  @JsonSerializable(explicitToJson: true)
  const factory Category({
    required int? id,
    required String title,
    required bool isDefault,
  }) = _Category;

  factory Category.fromJson(Map<String, Object?> json) =>
      _$CategoryFromJson(json);
}
