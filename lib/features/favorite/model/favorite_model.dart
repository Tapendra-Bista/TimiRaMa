// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:freezed_annotation/freezed_annotation.dart';

part 'favorite_model.freezed.dart';
part 'favorite_model.g.dart';

@freezed
abstract class FavoriteModel with _$FavoriteModel {
  const factory FavoriteModel({
    required String id,
    required List<String> favId,
  }) = _FavoriteModel;

  factory FavoriteModel.fromJson(Map<String, dynamic> json) =>
      _$FavoriteModelFromJson(json);

  factory FavoriteModel.empty() => FavoriteModel(id: '', favId: []);

  
}

extension FavoriteModelToMap on FavoriteModel {
  Map<String, dynamic> toMap() => toJson();
}
