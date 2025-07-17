// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'follow_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FollowModel _$FollowModelFromJson(Map<String, dynamic> json) => _FollowModel(
      id: json['id'] as String,
      followId:
          (json['followId'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$FollowModelToJson(_FollowModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'followId': instance.followId,
    };
