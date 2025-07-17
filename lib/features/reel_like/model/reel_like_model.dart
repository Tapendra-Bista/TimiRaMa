// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:freezed_annotation/freezed_annotation.dart';

part 'reel_like_model.freezed.dart';
part 'reel_like_model.g.dart';

@freezed
abstract class ReelLikeModel with _$ReelLikeModel {
  const factory ReelLikeModel({
    required String id,
    required List<String> reelLikeId ,
  }) = _ReelLikeModel;

  factory ReelLikeModel.fromJson(Map<String, dynamic> json) =>
      _$ReelLikeModelFromJson(json);

  factory ReelLikeModel.empty() => ReelLikeModel(id: '', reelLikeId : []);
}

extension ReelLikeModelToMap on ReelLikeModel {
  Map<String, dynamic> toMap() => toJson();
}
