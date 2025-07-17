// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:freezed_annotation/freezed_annotation.dart';

part 'block_model.freezed.dart';
part 'block_model.g.dart';

//---------------------Block model-----------------------
@freezed
abstract class BlockModel with _$BlockModel {
  const factory BlockModel({
    required String id,
    required List<String> blockId,
  }) = _BlockModel;
  factory BlockModel.fromJson(Map<String, dynamic> json) =>
      _$BlockModelFromJson(json);

  factory BlockModel.empty() => BlockModel(id: '', blockId: []);
}

extension   BlockModelToMap on BlockModel{
        Map<String,dynamic> toMap()  => toJson();
}