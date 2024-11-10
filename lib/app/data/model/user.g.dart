// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      user_id: (json['user_id'] as num).toInt(),
      nickname: json['nickname'] as String? ?? "",
      description: json['description'] as String? ?? "",
      picture_url: json['picture_url'] as String? ?? "",
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'user_id': instance.user_id,
      'nickname': instance.nickname,
      'description': instance.description,
      'picture_url': instance.picture_url,
    };
