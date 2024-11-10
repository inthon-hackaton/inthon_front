// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'draft.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DraftImpl _$$DraftImplFromJson(Map<String, dynamic> json) => _$DraftImpl(
      draft_id: (json['draft_id'] as num).toInt(),
      draft_link: json['draft_link'] as String,
      description: json['description'] as String,
      draft_used_count: (json['draft_used_count'] as num).toInt(),
      draft_user_list: (json['draft_user_list'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$DraftImplToJson(_$DraftImpl instance) =>
    <String, dynamic>{
      'draft_id': instance.draft_id,
      'draft_link': instance.draft_link,
      'description': instance.description,
      'draft_used_count': instance.draft_used_count,
      'draft_user_list': instance.draft_user_list,
    };
