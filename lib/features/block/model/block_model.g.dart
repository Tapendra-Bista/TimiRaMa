// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'block_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BlockModel _$BlockModelFromJson(Map<String, dynamic> json) => _BlockModel(
      id: json['id'] as String,
      blockId:
          (json['blockId'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$BlockModelToJson(_BlockModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'blockId': instance.blockId,
    };
