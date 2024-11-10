import 'package:freezed_annotation/freezed_annotation.dart';

part 'draft.freezed.dart';
part 'draft.g.dart';

@freezed
class Draft with _$Draft {
  factory Draft({
    required int draft_id,
    required String draft_link,
    required String description,
    required int draft_used_count,
    required List<String> draft_user_list,
  }) = _Draft;

  factory Draft.fromJson(Map<String, dynamic> json) => _$DraftFromJson(json);
}
