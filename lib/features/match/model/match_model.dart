import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:timirama/common/utils/timestamp_converter.dart';

part 'match_model.freezed.dart';
part 'match_model.g.dart';

@freezed
  abstract  class MatchModel with _$MatchModel {
  const factory MatchModel({
    required String id,
    @TimestampConverter() required DateTime matchedAt,
  }) = _MatchModel;

  factory MatchModel.fromJson(Map<String, dynamic> json) =>
      _$MatchModelFromJson(json);
}

extension MatchModelToMap on MatchModel {
  Map<String, dynamic> toMap() => toJson();
}
