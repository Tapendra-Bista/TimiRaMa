// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:freezed_annotation/freezed_annotation.dart';
part 'follow_model.freezed.dart';
part 'follow_model.g.dart';

//---------------------Follow model-----------------------
@freezed
abstract class FollowModel with _$FollowModel {
  const factory FollowModel({
    required String id,
    required List<String> followId,
  }) = _FollowModel;

  factory FollowModel.fromJson(Map<String, dynamic> json) =>
      _$FollowModelFromJson(json);
  factory FollowModel.empty() => FollowModel(id: '', followId: []);
}

extension FollowModelToMap on FollowModel {
  Map<String, dynamic> toMap() => toJson();
}
