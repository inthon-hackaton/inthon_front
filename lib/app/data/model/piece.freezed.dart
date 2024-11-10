// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'piece.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Piece _$PieceFromJson(Map<String, dynamic> json) {
  return _Piece.fromJson(json);
}

/// @nodoc
mixin _$Piece {
  int get piece_id => throw _privateConstructorUsedError;
  int get piece_number => throw _privateConstructorUsedError;
  String get picture_link => throw _privateConstructorUsedError;

  /// Serializes this Piece to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Piece
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PieceCopyWith<Piece> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PieceCopyWith<$Res> {
  factory $PieceCopyWith(Piece value, $Res Function(Piece) then) =
      _$PieceCopyWithImpl<$Res, Piece>;
  @useResult
  $Res call({int piece_id, int piece_number, String picture_link});
}

/// @nodoc
class _$PieceCopyWithImpl<$Res, $Val extends Piece>
    implements $PieceCopyWith<$Res> {
  _$PieceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Piece
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? piece_id = null,
    Object? piece_number = null,
    Object? picture_link = null,
  }) {
    return _then(_value.copyWith(
      piece_id: null == piece_id
          ? _value.piece_id
          : piece_id // ignore: cast_nullable_to_non_nullable
              as int,
      piece_number: null == piece_number
          ? _value.piece_number
          : piece_number // ignore: cast_nullable_to_non_nullable
              as int,
      picture_link: null == picture_link
          ? _value.picture_link
          : picture_link // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PieceImplCopyWith<$Res> implements $PieceCopyWith<$Res> {
  factory _$$PieceImplCopyWith(
          _$PieceImpl value, $Res Function(_$PieceImpl) then) =
      __$$PieceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int piece_id, int piece_number, String picture_link});
}

/// @nodoc
class __$$PieceImplCopyWithImpl<$Res>
    extends _$PieceCopyWithImpl<$Res, _$PieceImpl>
    implements _$$PieceImplCopyWith<$Res> {
  __$$PieceImplCopyWithImpl(
      _$PieceImpl _value, $Res Function(_$PieceImpl) _then)
      : super(_value, _then);

  /// Create a copy of Piece
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? piece_id = null,
    Object? piece_number = null,
    Object? picture_link = null,
  }) {
    return _then(_$PieceImpl(
      piece_id: null == piece_id
          ? _value.piece_id
          : piece_id // ignore: cast_nullable_to_non_nullable
              as int,
      piece_number: null == piece_number
          ? _value.piece_number
          : piece_number // ignore: cast_nullable_to_non_nullable
              as int,
      picture_link: null == picture_link
          ? _value.picture_link
          : picture_link // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PieceImpl implements _Piece {
  _$PieceImpl(
      {required this.piece_id,
      required this.piece_number,
      required this.picture_link});

  factory _$PieceImpl.fromJson(Map<String, dynamic> json) =>
      _$$PieceImplFromJson(json);

  @override
  final int piece_id;
  @override
  final int piece_number;
  @override
  final String picture_link;

  @override
  String toString() {
    return 'Piece(piece_id: $piece_id, piece_number: $piece_number, picture_link: $picture_link)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PieceImpl &&
            (identical(other.piece_id, piece_id) ||
                other.piece_id == piece_id) &&
            (identical(other.piece_number, piece_number) ||
                other.piece_number == piece_number) &&
            (identical(other.picture_link, picture_link) ||
                other.picture_link == picture_link));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, piece_id, piece_number, picture_link);

  /// Create a copy of Piece
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PieceImplCopyWith<_$PieceImpl> get copyWith =>
      __$$PieceImplCopyWithImpl<_$PieceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PieceImplToJson(
      this,
    );
  }
}

abstract class _Piece implements Piece {
  factory _Piece(
      {required final int piece_id,
      required final int piece_number,
      required final String picture_link}) = _$PieceImpl;

  factory _Piece.fromJson(Map<String, dynamic> json) = _$PieceImpl.fromJson;

  @override
  int get piece_id;
  @override
  int get piece_number;
  @override
  String get picture_link;

  /// Create a copy of Piece
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PieceImplCopyWith<_$PieceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
