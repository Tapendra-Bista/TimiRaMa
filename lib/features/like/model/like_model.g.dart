// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'like_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LikeModel _$LikeModelFromJson(Map<String, dynamic> json) => _LikeModel(
      id: json['id'] as String,
      likeId:
          (json['likeId'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$LikeModelToJson(_LikeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'likeId': instance.likeId,
    };
