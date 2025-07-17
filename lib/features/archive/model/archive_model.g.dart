// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'archive_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ArchiveModel _$ArchiveModelFromJson(Map<String, dynamic> json) =>
    _ArchiveModel(
      id: json['id'] as String,
      archiveId:
          (json['archiveId'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$ArchiveModelToJson(_ArchiveModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'archiveId': instance.archiveId,
    };
