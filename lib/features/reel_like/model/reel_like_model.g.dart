// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reel_like_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReelLikeModel _$ReelLikeModelFromJson(Map<String, dynamic> json) =>
    _ReelLikeModel(
      id: json['id'] as String,
      reelLikeId: (json['reelLikeId'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$ReelLikeModelToJson(_ReelLikeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'reelLikeId': instance.reelLikeId,
    };
