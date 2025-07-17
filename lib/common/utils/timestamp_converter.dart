import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

class TimestampConverter implements JsonConverter<Timestamp, Object?> {
  const TimestampConverter();

  @override
  Timestamp fromJson(Object? json) {
    if (json is Timestamp) return json;

    if (json is int) {
      // Handle milliseconds since epoch
      return Timestamp.fromMillisecondsSinceEpoch(json);
    }

    if (json is String) {
      final millis = int.tryParse(json);
      if (millis != null) {
        return Timestamp.fromMillisecondsSinceEpoch(millis);
      }
    }

    if (json is Map<String, dynamic>) {
      final seconds = json['_seconds'] ?? json['seconds'];
      final nanos = json['_nanoseconds'] ?? json['nanoseconds'] ?? 0;

      if (seconds is int && nanos is int) {
        return Timestamp(seconds, nanos);
      }
    }

    throw ArgumentError('Invalid timestamp json: $json');
  }

  @override
  Object toJson(Timestamp timestamp) => timestamp.millisecondsSinceEpoch;
}
