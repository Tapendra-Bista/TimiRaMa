// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MatchModel _$MatchModelFromJson(Map<String, dynamic> json) => _MatchModel(
      id: json['id'] as String,
      matchedAt: DateTime.parse(json['matchedAt'] as String),
    );

Map<String, dynamic> _$MatchModelToJson(_MatchModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'matchedAt': instance.matchedAt.toIso8601String(),
    };
