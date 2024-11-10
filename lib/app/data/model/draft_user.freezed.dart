// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'draft_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DraftUser _$DraftUserFromJson(Map<String, dynamic> json) {
  return _DraftUser.fromJson(json);
}

/// @nodoc
mixin _$DraftUser {
  List<String> get user_image_list => throw _privateConstructorUsedError;

  /// Serializes this DraftUser to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DraftUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DraftUserCopyWith<DraftUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DraftUserCopyWith<$Res> {
  factory $DraftUserCopyWith(DraftUser value, $Res Function(DraftUser) then) =
      _$DraftUserCopyWithImpl<$Res, DraftUser>;
  @useResult
  $Res call({List<String> user_image_list});
}

/// @nodoc
class _$DraftUserCopyWithImpl<$Res, $Val extends DraftUser>
    implements $DraftUserCopyWith<$Res> {
  _$DraftUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DraftUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user_image_list = null,
  }) {
    return _then(_value.copyWith(
      user_image_list: null == user_image_list
          ? _value.user_image_list
          : user_image_list // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DraftUserImplCopyWith<$Res>
    implements $DraftUserCopyWith<$Res> {
  factory _$$DraftUserImplCopyWith(
          _$DraftUserImpl value, $Res Function(_$DraftUserImpl) then) =
      __$$DraftUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> user_image_list});
}

/// @nodoc
class __$$DraftUserImplCopyWithImpl<$Res>
    extends _$DraftUserCopyWithImpl<$Res, _$DraftUserImpl>
    implements _$$DraftUserImplCopyWith<$Res> {
  __$$DraftUserImplCopyWithImpl(
      _$DraftUserImpl _value, $Res Function(_$DraftUserImpl) _then)
      : super(_value, _then);

  /// Create a copy of DraftUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user_image_list = null,
  }) {
    return _then(_$DraftUserImpl(
      user_image_list: null == user_image_list
          ? _value._user_image_list
          : user_image_list // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DraftUserImpl implements _DraftUser {
  _$DraftUserImpl({final List<String> user_image_list = const []})
      : _user_image_list = user_image_list;

  factory _$DraftUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$DraftUserImplFromJson(json);

  final List<String> _user_image_list;
  @override
  @JsonKey()
  List<String> get user_image_list {
    if (_user_image_list is EqualUnmodifiableListView) return _user_image_list;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_user_image_list);
  }

  @override
  String toString() {
    return 'DraftUser(user_image_list: $user_image_list)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DraftUserImpl &&
            const DeepCollectionEquality()
                .equals(other._user_image_list, _user_image_list));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_user_image_list));

  /// Create a copy of DraftUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DraftUserImplCopyWith<_$DraftUserImpl> get copyWith =>
      __$$DraftUserImplCopyWithImpl<_$DraftUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DraftUserImplToJson(
      this,
    );
  }
}

abstract class _DraftUser implements DraftUser {
  factory _DraftUser({final List<String> user_image_list}) = _$DraftUserImpl;

  factory _DraftUser.fromJson(Map<String, dynamic> json) =
      _$DraftUserImpl.fromJson;

  @override
  List<String> get user_image_list;

  /// Create a copy of DraftUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DraftUserImplCopyWith<_$DraftUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
