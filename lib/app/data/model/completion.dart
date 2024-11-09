import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inthon_front/app/data/model/piece.dart';

part 'completion.freezed.dart';
part 'completion.g.dart';

@freezed
class Completion with _$Completion {
  factory Completion({
    required int completion_id,
    required DateTime created_at,
    @Default([]) List<Piece> pieces,
  }) = _Completion;

  factory Completion.fromJson(Map<String, dynamic> json) =>
      _$CompletionFromJson(json);
}
