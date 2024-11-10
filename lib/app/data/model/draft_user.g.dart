// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'draft_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DraftUserImpl _$$DraftUserImplFromJson(Map<String, dynamic> json) =>
    _$DraftUserImpl(
      user_image_list: (json['user_image_list'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$DraftUserImplToJson(_$DraftUserImpl instance) =>
    <String, dynamic>{
      'user_image_list': instance.user_image_list,
    };
