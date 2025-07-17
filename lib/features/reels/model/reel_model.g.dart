// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reel_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReelModel _$ReelModelFromJson(Map<String, dynamic> json) => _ReelModel(
      uid: json['uid'] as String,
      rid: json['rid'] as String,
      profileImage: json['profileImage'] as String,
      name: json['name'] as String,
      reelUrl: json['reelUrl'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$ReelModelToJson(_ReelModel instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'rid': instance.rid,
      'profileImage': instance.profileImage,
      'name': instance.name,
      'reelUrl': instance.reelUrl,
      'description': instance.description,
    };
