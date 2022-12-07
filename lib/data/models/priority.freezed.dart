// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'priority.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Priority _$PriorityFromJson(Map<String, dynamic> json) {
  return _Priority.fromJson(json);
}

/// @nodoc
mixin _$Priority {
  int? get id => throw _privateConstructorUsedError;
  String get emoji => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  int get colorId => throw _privateConstructorUsedError;
  List<Category> get categories => throw _privateConstructorUsedError;
  List<Task> get tasks => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PriorityCopyWith<Priority> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PriorityCopyWith<$Res> {
  factory $PriorityCopyWith(Priority value, $Res Function(Priority) then) =
      _$PriorityCopyWithImpl<$Res, Priority>;
  @useResult
  $Res call(
      {int? id,
      String emoji,
      String title,
      int colorId,
      List<Category> categories,
      List<Task> tasks});
}

/// @nodoc
class _$PriorityCopyWithImpl<$Res, $Val extends Priority>
    implements $PriorityCopyWith<$Res> {
  _$PriorityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? emoji = null,
    Object? title = null,
    Object? colorId = null,
    Object? categories = null,
    Object? tasks = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      emoji: null == emoji
          ? _value.emoji
          : emoji // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      colorId: null == colorId
          ? _value.colorId
          : colorId // ignore: cast_nullable_to_non_nullable
              as int,
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<Category>,
      tasks: null == tasks
          ? _value.tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<Task>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PriorityCopyWith<$Res> implements $PriorityCopyWith<$Res> {
  factory _$$_PriorityCopyWith(
          _$_Priority value, $Res Function(_$_Priority) then) =
      __$$_PriorityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String emoji,
      String title,
      int colorId,
      List<Category> categories,
      List<Task> tasks});
}

/// @nodoc
class __$$_PriorityCopyWithImpl<$Res>
    extends _$PriorityCopyWithImpl<$Res, _$_Priority>
    implements _$$_PriorityCopyWith<$Res> {
  __$$_PriorityCopyWithImpl(
      _$_Priority _value, $Res Function(_$_Priority) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? emoji = null,
    Object? title = null,
    Object? colorId = null,
    Object? categories = null,
    Object? tasks = null,
  }) {
    return _then(_$_Priority(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      emoji: null == emoji
          ? _value.emoji
          : emoji // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      colorId: null == colorId
          ? _value.colorId
          : colorId // ignore: cast_nullable_to_non_nullable
              as int,
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<Category>,
      tasks: null == tasks
          ? _value._tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<Task>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_Priority extends _Priority {
  const _$_Priority(
      {required this.id,
      required this.emoji,
      required this.title,
      required this.colorId,
      required final List<Category> categories,
      required final List<Task> tasks})
      : _categories = categories,
        _tasks = tasks,
        super._();

  factory _$_Priority.fromJson(Map<String, dynamic> json) =>
      _$$_PriorityFromJson(json);

  @override
  final int? id;
  @override
  final String emoji;
  @override
  final String title;
  @override
  final int colorId;
  final List<Category> _categories;
  @override
  List<Category> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  final List<Task> _tasks;
  @override
  List<Task> get tasks {
    if (_tasks is EqualUnmodifiableListView) return _tasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tasks);
  }

  @override
  String toString() {
    return 'Priority(id: $id, emoji: $emoji, title: $title, colorId: $colorId, categories: $categories, tasks: $tasks)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Priority &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.emoji, emoji) || other.emoji == emoji) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.colorId, colorId) || other.colorId == colorId) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            const DeepCollectionEquality().equals(other._tasks, _tasks));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      emoji,
      title,
      colorId,
      const DeepCollectionEquality().hash(_categories),
      const DeepCollectionEquality().hash(_tasks));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PriorityCopyWith<_$_Priority> get copyWith =>
      __$$_PriorityCopyWithImpl<_$_Priority>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PriorityToJson(
      this,
    );
  }
}

abstract class _Priority extends Priority {
  const factory _Priority(
      {required final int? id,
      required final String emoji,
      required final String title,
      required final int colorId,
      required final List<Category> categories,
      required final List<Task> tasks}) = _$_Priority;
  const _Priority._() : super._();

  factory _Priority.fromJson(Map<String, dynamic> json) = _$_Priority.fromJson;

  @override
  int? get id;
  @override
  String get emoji;
  @override
  String get title;
  @override
  int get colorId;
  @override
  List<Category> get categories;
  @override
  List<Task> get tasks;
  @override
  @JsonKey(ignore: true)
  _$$_PriorityCopyWith<_$_Priority> get copyWith =>
      throw _privateConstructorUsedError;
}
