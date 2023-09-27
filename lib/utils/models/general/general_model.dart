import 'package:json_annotation/json_annotation.dart';

part 'general_model.g.dart';

@JsonSerializable(explicitToJson: true, createToJson: true, createFactory: true)
class GeneralModel {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "number")
  int? number;
  @JsonKey(name: "cars")
  List<GeneralModel>? cars;

  GeneralModel({this.id, this.name, this.number,this.cars});

  factory GeneralModel.fromJson(Map<String, dynamic> json) =>
      _$GeneralModelFromJson(json);

  Map<String, dynamic> toJson() => _$GeneralModelToJson(this);

  @override
  String toString() {
    // TODO: implement toString
    return name ?? number.toString() ?? "";
  }
}
