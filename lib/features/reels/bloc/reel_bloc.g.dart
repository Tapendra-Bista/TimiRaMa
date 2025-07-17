// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reel_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Initial _$InitialFromJson(Map<String, dynamic> json) => Initial(
      reelModel: (json['reelModel'] as List<dynamic>?)
              ?.map((e) => ReelModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$InitialToJson(Initial instance) => <String, dynamic>{
      'reelModel': instance.reelModel,
      'runtimeType': instance.$type,
    };

ReelError _$ReelErrorFromJson(Map<String, dynamic> json) => ReelError(
      errorMessage: json['errorMessage'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$ReelErrorToJson(ReelError instance) => <String, dynamic>{
      'errorMessage': instance.errorMessage,
      'runtimeType': instance.$type,
    };

ReelEmpty _$ReelEmptyFromJson(Map<String, dynamic> json) => ReelEmpty(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$ReelEmptyToJson(ReelEmpty instance) => <String, dynamic>{
      'runtimeType': instance.$type,
    };

Loading _$LoadingFromJson(Map<String, dynamic> json) => Loading(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$LoadingToJson(Loading instance) => <String, dynamic>{
      'runtimeType': instance.$type,
    };
