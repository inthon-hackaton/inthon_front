// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_stat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserStatImpl _$$UserStatImplFromJson(Map<String, dynamic> json) =>
    _$UserStatImpl(
      total_pieces: (json['total_pieces'] as num).toInt(),
      total_likes: (json['total_likes'] as num).toInt(),
      total_includes: (json['total_includes'] as num).toInt(),
    );

Map<String, dynamic> _$$UserStatImplToJson(_$UserStatImpl instance) =>
    <String, dynamic>{
      'total_pieces': instance.total_pieces,
      'total_likes': instance.total_likes,
      'total_includes': instance.total_includes,
    };
