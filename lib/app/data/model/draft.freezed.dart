// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'draft.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Draft _$DraftFromJson(Map<String, dynamic> json) {
  return _Draft.fromJson(json);
}

/// @nodoc
mixin _$Draft {
  int get draft_id => throw _privateConstructorUsedError;
  String get draft_link => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  int get draft_used_count => throw _privateConstructorUsedError;
  List<String> get draft_user_list => throw _privateConstructorUsedError;

  /// Serializes this Draft to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Draft
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DraftCopyWith<Draft> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DraftCopyWith<$Res> {
  factory $DraftCopyWith(Draft value, $Res Function(Draft) then) =
      _$DraftCopyWithImpl<$Res, Draft>;
  @useResult
  $Res call(
      {int draft_id,
      String draft_link,
      String description,
      int draft_used_count,
      List<String> draft_user_list});
}

/// @nodoc
class _$DraftCopyWithImpl<$Res, $Val extends Draft>
    implements $DraftCopyWith<$Res> {
  _$DraftCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Draft
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? draft_id = null,
    Object? draft_link = null,
    Object? description = null,
    Object? draft_used_count = null,
    Object? draft_user_list = null,
  }) {
    return _then(_value.copyWith(
      draft_id: null == draft_id
          ? _value.draft_id
          : draft_id // ignore: cast_nullable_to_non_nullable
              as int,
      draft_link: null == draft_link
          ? _value.draft_link
          : draft_link // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      draft_used_count: null == draft_used_count
          ? _value.draft_used_count
          : draft_used_count // ignore: cast_nullable_to_non_nullable
              as int,
      draft_user_list: null == draft_user_list
          ? _value.draft_user_list
          : draft_user_list // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DraftImplCopyWith<$Res> implements $DraftCopyWith<$Res> {
  factory _$$DraftImplCopyWith(
          _$DraftImpl value, $Res Function(_$DraftImpl) then) =
      __$$DraftImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int draft_id,
      String draft_link,
      String description,
      int draft_used_count,
      List<String> draft_user_list});
}

/// @nodoc
class __$$DraftImplCopyWithImpl<$Res>
    extends _$DraftCopyWithImpl<$Res, _$DraftImpl>
    implements _$$DraftImplCopyWith<$Res> {
  __$$DraftImplCopyWithImpl(
      _$DraftImpl _value, $Res Function(_$DraftImpl) _then)
      : super(_value, _then);

  /// Create a copy of Draft
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? draft_id = null,
    Object? draft_link = null,
    Object? description = null,
    Object? draft_used_count = null,
    Object? draft_user_list = null,
  }) {
    return _then(_$DraftImpl(
      draft_id: null == draft_id
          ? _value.draft_id
          : draft_id // ignore: cast_nullable_to_non_nullable
              as int,
      draft_link: null == draft_link
          ? _value.draft_link
          : draft_link // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      draft_used_count: null == draft_used_count
          ? _value.draft_used_count
          : draft_used_count // ignore: cast_nullable_to_non_nullable
              as int,
      draft_user_list: null == draft_user_list
          ? _value._draft_user_list
          : draft_user_list // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DraftImpl implements _Draft {
  _$DraftImpl(
      {required this.draft_id,
      required this.draft_link,
      required this.description,
      required this.draft_used_count,
      required final List<String> draft_user_list})
      : _draft_user_list = draft_user_list;

  factory _$DraftImpl.fromJson(Map<String, dynamic> json) =>
      _$$DraftImplFromJson(json);

  @override
  final int draft_id;
  @override
  final String draft_link;
  @override
  final String description;
  @override
  final int draft_used_count;
  final List<String> _draft_user_list;
  @override
  List<String> get draft_user_list {
    if (_draft_user_list is EqualUnmodifiableListView) return _draft_user_list;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_draft_user_list);
  }

  @override
  String toString() {
    return 'Draft(draft_id: $draft_id, draft_link: $draft_link, description: $description, draft_used_count: $draft_used_count, draft_user_list: $draft_user_list)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DraftImpl &&
            (identical(other.draft_id, draft_id) ||
                other.draft_id == draft_id) &&
            (identical(other.draft_link, draft_link) ||
                other.draft_link == draft_link) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.draft_used_count, draft_used_count) ||
                other.draft_used_count == draft_used_count) &&
            const DeepCollectionEquality()
                .equals(other._draft_user_list, _draft_user_list));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      draft_id,
      draft_link,
      description,
      draft_used_count,
      const DeepCollectionEquality().hash(_draft_user_list));

  /// Create a copy of Draft
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DraftImplCopyWith<_$DraftImpl> get copyWith =>
      __$$DraftImplCopyWithImpl<_$DraftImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DraftImplToJson(
      this,
    );
  }
}

abstract class _Draft implements Draft {
  factory _Draft(
      {required final int draft_id,
      required final String draft_link,
      required final String description,
      required final int draft_used_count,
      required final List<String> draft_user_list}) = _$DraftImpl;

  factory _Draft.fromJson(Map<String, dynamic> json) = _$DraftImpl.fromJson;

  @override
  int get draft_id;
  @override
  String get draft_link;
  @override
  String get description;
  @override
  int get draft_used_count;
  @override
  List<String> get draft_user_list;

  /// Create a copy of Draft
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DraftImplCopyWith<_$DraftImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
