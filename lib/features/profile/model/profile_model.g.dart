// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) =>
    _ProfileModel(
      id: json['id'] as String,
      pseudo: json['pseudo'] as String,
      sex: json['sex'] as String,
      age: (json['age'] as num).toInt(),
      country: json['country'] as String,
      city: json['city'] as String,
      interests:
          (json['interests'] as List<dynamic>).map((e) => e as String).toList(),
      createdDate: const TimestampConverter().fromJson(json['createdDate']),
      imgURL: json['imgURL'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$ProfileModelToJson(_ProfileModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'pseudo': instance.pseudo,
      'sex': instance.sex,
      'age': instance.age,
      'country': instance.country,
      'city': instance.city,
      'interests': instance.interests,
      'createdDate': const TimestampConverter().toJson(instance.createdDate),
      'imgURL': instance.imgURL,
      'description': instance.description,
    };
