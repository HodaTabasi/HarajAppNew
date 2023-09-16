import 'package:haraj/utils/models/general/general_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'instruction_model.g.dart';

@JsonSerializable(explicitToJson: true, createToJson: true, createFactory: true)
class InstructionModel {
  @JsonKey(name: "data")
  List<GeneralModel>? data;

  InstructionModel({this.data});

  factory InstructionModel.fromJson(Map<String, dynamic> json) =>
      _$InstructionModelFromJson(json);

  Map<String, dynamic> toJson() => _$InstructionModelToJson(this);
}
