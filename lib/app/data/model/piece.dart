import 'package:freezed_annotation/freezed_annotation.dart';

part 'piece.freezed.dart';
part 'piece.g.dart';

@freezed
class Piece with _$Piece {
  factory Piece({
    required int piece_id,
    required int piece_number,
    required String picture_link,
  }) = _Piece;

  factory Piece.fromJson(Map<String, dynamic> json) => _$PieceFromJson(json);
}
