// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:freezed_annotation/freezed_annotation.dart';

part 'like_model.freezed.dart';
part 'like_model.g.dart';

@freezed
abstract class LikeModel with _$LikeModel {
  const factory LikeModel({
    required String id,
    required List<String> likeId,
  }) = _LikeModel;

  factory LikeModel.fromJson(Map<String, dynamic> json) =>
      _$LikeModelFromJson(json);

  factory LikeModel.empty() => LikeModel(id: '', likeId: []);
}

extension LikeModelToMap on LikeModel {
  Map<String, dynamic> toMap() => toJson();
}
