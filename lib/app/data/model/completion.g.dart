// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'completion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CompletionImpl _$$CompletionImplFromJson(Map<String, dynamic> json) =>
    _$CompletionImpl(
      completion_id: (json['completion_id'] as num).toInt(),
      created_at: DateTime.parse(json['created_at'] as String),
      pieces: (json['pieces'] as List<dynamic>?)
              ?.map((e) => Piece.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$CompletionImplToJson(_$CompletionImpl instance) =>
    <String, dynamic>{
      'completion_id': instance.completion_id,
      'created_at': instance.created_at.toIso8601String(),
      'pieces': instance.pieces,
    };
