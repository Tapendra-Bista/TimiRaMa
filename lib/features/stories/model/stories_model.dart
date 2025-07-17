// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:timirama/common/utils/timestamp_converter.dart';

part 'stories_model.freezed.dart';
part 'stories_model.g.dart';

@freezed
abstract class StoriesModel with _$StoriesModel {
  const factory StoriesModel({
    required String uid,
    required List<String> containUrl,
    @TimestampConverter() required List<Timestamp> createdDate,
    required userName,
    required userImg,
  }) = _StoriesModel;
  factory StoriesModel.fromJson(Map<String, dynamic> json) =>
      _$StoriesModelFromJson(json);

  factory StoriesModel.empty() => StoriesModel(
    uid: '',
    containUrl: [],
    createdDate: [],
    userName: '',
    userImg: '',
  );
}

extension StoriesModelToMap on StoriesModel {
  Map<String, dynamic> toMap() => toJson();
}

@freezed
abstract class StoriesFetchModel with _$StoriesFetchModel {
  const factory StoriesFetchModel({
    required String id,
    required List<String> containUrl,
    @TimestampConverter() required List<Timestamp> createdDate,
    required String userName,
    required String userImg,
  }) = _StoriesFetchModel;
  factory StoriesFetchModel.fromJson(Map<String, dynamic> json) =>
      _$StoriesFetchModelFromJson(json);

  factory StoriesFetchModel.empty() => StoriesFetchModel(
    id: '',
    containUrl: [],
    createdDate: [],
    userName: '',
    userImg: '',
  );
}

extension StoriesFetchModelToMap on StoriesFetchModel {
  Map<String, dynamic> toMap() => toJson();
}
