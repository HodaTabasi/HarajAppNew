import 'package:haraj/utils/models/governorates_model/citiey_model.dart';
import 'package:json_annotation/json_annotation.dart';

import 'country.dart';
part 'governorate_model.g.dart';

@JsonSerializable()
class GovernorateModel extends Country{
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "cities")
  List<CityModel>? cities;

  GovernorateModel({this.id, this.name, this.cities});

  factory GovernorateModel.fromJson(Map<String, dynamic> json) =>_$GovernorateModelFromJson(json);

Map<String, dynamic> toJson() =>_$GovernorateModelToJson(this);

@override
  String toString() {
    // TODO: implement toString
    return name??"";
  }
}