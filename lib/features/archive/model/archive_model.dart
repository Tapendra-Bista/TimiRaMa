import 'package:freezed_annotation/freezed_annotation.dart';

part 'archive_model.freezed.dart';
part 'archive_model.g.dart';

@freezed
abstract class ArchiveModel with _$ArchiveModel {
  const factory ArchiveModel({
    required String id,
    required List<String> archiveId,
  }) = _ArchiveModel;

  factory ArchiveModel.fromJson(Map<String, dynamic> json) =>
      _$ArchiveModelFromJson(json);

  factory ArchiveModel.empty() => ArchiveModel(id: '', archiveId: []);
}

extension ArchiveModelToMap on ArchiveModel {
  Map<String, dynamic> toMap() => toJson();
}
