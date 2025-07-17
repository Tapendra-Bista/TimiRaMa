import 'package:freezed_annotation/freezed_annotation.dart';

part 'reel_model.freezed.dart';
part 'reel_model.g.dart';

//------------Reel Model-------------------
@freezed
abstract class ReelModel with _$ReelModel {
  const factory ReelModel({
    required String uid,
    required String rid,
    required String profileImage,
    required String name,
    required String reelUrl,
    required String description,
  }) = _ReelModel;

  /// Deserialization: From JSON to Model
  factory ReelModel.fromJson(Map<String, dynamic> json) =>
      _$ReelModelFromJson(json);
}

/// Optional extension for manual mapping if needed
extension ReelModelToMap on ReelModel {
  /// JSON serialization (alias for toJson)
  Map<String, dynamic> toMap() => toJson();
}
