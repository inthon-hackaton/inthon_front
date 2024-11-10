// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_stat.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserStat _$UserStatFromJson(Map<String, dynamic> json) {
  return _UserStat.fromJson(json);
}

/// @nodoc
mixin _$UserStat {
  int get total_pieces => throw _privateConstructorUsedError;
  int get total_likes => throw _privateConstructorUsedError;
  int get total_includes => throw _privateConstructorUsedError;

  /// Serializes this UserStat to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserStat
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserStatCopyWith<UserStat> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserStatCopyWith<$Res> {
  factory $UserStatCopyWith(UserStat value, $Res Function(UserStat) then) =
      _$UserStatCopyWithImpl<$Res, UserStat>;
  @useResult
  $Res call({int total_pieces, int total_likes, int total_includes});
}

/// @nodoc
class _$UserStatCopyWithImpl<$Res, $Val extends UserStat>
    implements $UserStatCopyWith<$Res> {
  _$UserStatCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserStat
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total_pieces = null,
    Object? total_likes = null,
    Object? total_includes = null,
  }) {
    return _then(_value.copyWith(
      total_pieces: null == total_pieces
          ? _value.total_pieces
          : total_pieces // ignore: cast_nullable_to_non_nullable
              as int,
      total_likes: null == total_likes
          ? _value.total_likes
          : total_likes // ignore: cast_nullable_to_non_nullable
              as int,
      total_includes: null == total_includes
          ? _value.total_includes
          : total_includes // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserStatImplCopyWith<$Res>
    implements $UserStatCopyWith<$Res> {
  factory _$$UserStatImplCopyWith(
          _$UserStatImpl value, $Res Function(_$UserStatImpl) then) =
      __$$UserStatImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int total_pieces, int total_likes, int total_includes});
}

/// @nodoc
class __$$UserStatImplCopyWithImpl<$Res>
    extends _$UserStatCopyWithImpl<$Res, _$UserStatImpl>
    implements _$$UserStatImplCopyWith<$Res> {
  __$$UserStatImplCopyWithImpl(
      _$UserStatImpl _value, $Res Function(_$UserStatImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserStat
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total_pieces = null,
    Object? total_likes = null,
    Object? total_includes = null,
  }) {
    return _then(_$UserStatImpl(
      total_pieces: null == total_pieces
          ? _value.total_pieces
          : total_pieces // ignore: cast_nullable_to_non_nullable
              as int,
      total_likes: null == total_likes
          ? _value.total_likes
          : total_likes // ignore: cast_nullable_to_non_nullable
              as int,
      total_includes: null == total_includes
          ? _value.total_includes
          : total_includes // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserStatImpl implements _UserStat {
  _$UserStatImpl(
      {required this.total_pieces,
      required this.total_likes,
      required this.total_includes});

  factory _$UserStatImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserStatImplFromJson(json);

  @override
  final int total_pieces;
  @override
  final int total_likes;
  @override
  final int total_includes;

  @override
  String toString() {
    return 'UserStat(total_pieces: $total_pieces, total_likes: $total_likes, total_includes: $total_includes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserStatImpl &&
            (identical(other.total_pieces, total_pieces) ||
                other.total_pieces == total_pieces) &&
            (identical(other.total_likes, total_likes) ||
                other.total_likes == total_likes) &&
            (identical(other.total_includes, total_includes) ||
                other.total_includes == total_includes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, total_pieces, total_likes, total_includes);

  /// Create a copy of UserStat
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserStatImplCopyWith<_$UserStatImpl> get copyWith =>
      __$$UserStatImplCopyWithImpl<_$UserStatImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserStatImplToJson(
      this,
    );
  }
}

abstract class _UserStat implements UserStat {
  factory _UserStat(
      {required final int total_pieces,
      required final int total_likes,
      required final int total_includes}) = _$UserStatImpl;

  factory _UserStat.fromJson(Map<String, dynamic> json) =
      _$UserStatImpl.fromJson;

  @override
  int get total_pieces;
  @override
  int get total_likes;
  @override
  int get total_includes;

  /// Create a copy of UserStat
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserStatImplCopyWith<_$UserStatImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
