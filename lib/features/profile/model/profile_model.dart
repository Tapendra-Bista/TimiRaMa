import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:timirama/common/utils/timestamp_converter.dart';

part 'profile_model.freezed.dart';
part 'profile_model.g.dart';

@freezed
abstract class ProfileModel with _$ProfileModel {
  const factory ProfileModel({
    required String id,
    required String pseudo,
    required String sex,
    required int age,
    required String country,
    required String city,
    required List<String> interests,
    @TimestampConverter() required Timestamp createdDate,
    required String imgURL,
    required String description,
  }) = _ProfileModel;

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);

  factory ProfileModel.empty() => ProfileModel(
    id: '',
    pseudo: '',
    sex: '',
    age: 0,
    country: '',
    city: '',
    interests: const [],
    createdDate: Timestamp.fromDate(DateTime.now()),
    imgURL: '',
    description: '',
  );
}

extension ProfileModelToMap on ProfileModel {
  /// JSON serialization (alias for toJson)
  Map<String, dynamic> toMap() => toJson();
}
