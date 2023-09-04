import 'package:json_annotation/json_annotation.dart';
part 'citiey_model.g.dart';

@JsonSerializable()
class CityModel {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;

  CityModel({this.id, this.name});

  factory CityModel.fromJson(Map<String, dynamic> json) =>_$CityModelFromJson(json);

  Map<String, dynamic> toJson() =>_$CityModelToJson(this);
}