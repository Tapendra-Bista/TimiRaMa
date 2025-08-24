import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:timirama/common/utils/timestamp_converter.dart';

part 'comment_model.freezed.dart';
part 'comment_model.g.dart';

//Comment Model
@freezed
abstract class CommentModel with _$CommentModel {
  const factory CommentModel({
    required String profile,
    required String pseudo,
    required String content,
    @TimestampConverter() required Timestamp createdAt,
  }) = _CommentModel;

  factory CommentModel.fromJson(Map<String, dynamic> json) =>
      _$CommentModelFromJson(json);
}
