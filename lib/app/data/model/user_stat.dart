import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_stat.freezed.dart';
part 'user_stat.g.dart';

@freezed
class UserStat with _$UserStat {
  factory UserStat({
    required int total_pieces,
    required int total_likes,
    required int total_includes,
  }) = _UserStat;

  factory UserStat.fromJson(Map<String, dynamic> json) =>
      _$UserStatFromJson(json);
}
