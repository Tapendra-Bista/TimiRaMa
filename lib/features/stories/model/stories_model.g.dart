// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stories_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StoriesModel _$StoriesModelFromJson(Map<String, dynamic> json) =>
    _StoriesModel(
      uid: json['uid'] as String,
      containUrl: (json['containUrl'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      createdDate: (json['createdDate'] as List<dynamic>)
          .map(const TimestampConverter().fromJson)
          .toList(),
      userName: json['userName'],
      userImg: json['userImg'],
    );

Map<String, dynamic> _$StoriesModelToJson(_StoriesModel instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'containUrl': instance.containUrl,
      'createdDate':
          instance.createdDate.map(const TimestampConverter().toJson).toList(),
      'userName': instance.userName,
      'userImg': instance.userImg,
    };

_StoriesFetchModel _$StoriesFetchModelFromJson(Map<String, dynamic> json) =>
    _StoriesFetchModel(
      id: json['id'] as String,
      containUrl: (json['containUrl'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      createdDate: (json['createdDate'] as List<dynamic>)
          .map(const TimestampConverter().fromJson)
          .toList(),
      userName: json['userName'] as String,
      userImg: json['userImg'] as String,
    );

Map<String, dynamic> _$StoriesFetchModelToJson(_StoriesFetchModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'containUrl': instance.containUrl,
      'createdDate':
          instance.createdDate.map(const TimestampConverter().toJson).toList(),
      'userName': instance.userName,
      'userImg': instance.userImg,
    };
