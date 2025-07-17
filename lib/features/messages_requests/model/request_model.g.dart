// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Requestmodel _$RequestmodelFromJson(Map<String, dynamic> json) =>
    _Requestmodel(
      senderProfile: json['senderProfile'] as String,
      senderName: json['senderName'] as String,
      senderId: json['senderId'] as String,
      responseStatus:
          $enumDecode(_$ResponseStatusEnumMap, json['responseStatus']),
      requestStatus: $enumDecode(_$RequestStatusEnumMap, json['requestStatus']),
      receiverId: json['receiverId'] as String,
      receiverProfile: json['receiverProfile'] as String,
      receiverName: json['receiverName'] as String,
      createdAt: const TimestampConverter().fromJson(json['createdAt']),
    );

Map<String, dynamic> _$RequestmodelToJson(_Requestmodel instance) =>
    <String, dynamic>{
      'senderProfile': instance.senderProfile,
      'senderName': instance.senderName,
      'senderId': instance.senderId,
      'responseStatus': _$ResponseStatusEnumMap[instance.responseStatus]!,
      'requestStatus': _$RequestStatusEnumMap[instance.requestStatus]!,
      'receiverId': instance.receiverId,
      'receiverProfile': instance.receiverProfile,
      'receiverName': instance.receiverName,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
    };

const _$ResponseStatusEnumMap = {
  ResponseStatus.Initial: 'Initial',
  ResponseStatus.Accepted: 'Accepted',
};

const _$RequestStatusEnumMap = {
  RequestStatus.Send: 'Send',
  RequestStatus.Read: 'Read',
};
