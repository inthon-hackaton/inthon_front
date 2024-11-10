// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'piece.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PieceImpl _$$PieceImplFromJson(Map<String, dynamic> json) => _$PieceImpl(
      piece_id: (json['piece_id'] as num).toInt(),
      piece_number: (json['piece_number'] as num).toInt(),
      picture_link: json['picture_link'] as String,
      nickname: json['nickname'] as String? ?? "",
      profile_picture_link: json['profile_picture_link'] as String? ?? "",
    );

Map<String, dynamic> _$$PieceImplToJson(_$PieceImpl instance) =>
    <String, dynamic>{
      'piece_id': instance.piece_id,
      'piece_number': instance.piece_number,
      'picture_link': instance.picture_link,
      'nickname': instance.nickname,
      'profile_picture_link': instance.profile_picture_link,
    };
