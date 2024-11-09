import 'package:freezed_annotation/freezed_annotation.dart';

part 'draft_user.freezed.dart';
part 'draft_user.g.dart';

@freezed
class DraftUser with _$DraftUser {
  factory DraftUser({
    @Default([]) List<String> user_image_list,
  }) = _DraftUser;

  factory DraftUser.fromJson(Map<String, dynamic> json) =>
      _$DraftUserFromJson(json);
}
