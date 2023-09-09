import 'package:json_annotation/json_annotation.dart';

import 'country.dart';
part 'citiey_model.g.dart';

@JsonSerializable()
class CityModel extends Country{
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;

  CityModel({this.id, this.name});

  factory CityModel.fromJson(Map<String, dynamic> json) =>_$CityModelFromJson(json);

  Map<String, dynamic> toJson() =>_$CityModelToJson(this);
  @override
  String toString() {
    // TODO: implement toString
    return name??"";
  }
}