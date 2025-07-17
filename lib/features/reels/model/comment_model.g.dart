// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CommentModel _$CommentModelFromJson(Map<String, dynamic> json) =>
    _CommentModel(
      profile: json['profile'] as String,
      pseudo: json['pseudo'] as String,
      content: json['content'] as String,
      createdAt: const TimestampConverter().fromJson(json['createdAt']),
    );

Map<String, dynamic> _$CommentModelToJson(_CommentModel instance) =>
    <String, dynamic>{
      'profile': instance.profile,
      'pseudo': instance.pseudo,
      'content': instance.content,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
    };
