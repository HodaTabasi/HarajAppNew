import 'package:haraj/utils/api/process_response.dart';

import '../general/general_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'car_properties.g.dart';

@JsonSerializable()
class CarProperties extends ProcessResponse{

    @JsonKey(name: "brands")
  List<GeneralModel>? brands;
    @JsonKey(name: "categories")
  List<GeneralModel>? categories;
    @JsonKey(name: "fuels")
  List<GeneralModel>? fuels;
    @JsonKey(name: "bodies")
  List<GeneralModel>? bodies;
    @JsonKey(name: "standards")
  List<GeneralModel>? standards;
    @JsonKey(name: "colors")
  List<GeneralModel>? colors;
    @JsonKey(name: "general-statuses")
  List<GeneralModel>? generalStatuses;
    @JsonKey(name: "mechanical-statuses")
  List<GeneralModel>? mechanicalStatuses;
    @JsonKey(name: "gears")
  List<GeneralModel>? gears;
    @JsonKey(name: "driving-sides")
  List<GeneralModel>? drivingSides;
    @JsonKey(name: "technical-advantages")
  List<GeneralModel>? technicalAdvantages;
    @JsonKey(name: "seats")
  List<GeneralModel>? seats;
    @JsonKey(name: "doors")
  List<GeneralModel>? doors;
    @JsonKey(name: "cylinders")
  List<GeneralModel>? cylinders;
    @JsonKey(name: "engines")
  List<GeneralModel>? engines;

  CarProperties(
      {this.brands,
        this.categories,
        this.fuels,
        this.bodies,
        this.standards,
        this.colors,
        this.generalStatuses,
        this.mechanicalStatuses,
        this.gears,
        this.drivingSides,
        this.technicalAdvantages,
        this.seats,
        this.doors,
        this.cylinders,
        this.engines,
        });

  factory CarProperties.fromJson(Map<String, dynamic> json) =>_$CarPropertiesFromJson(json);

  toJson() =>_$CarPropertiesToJson(this);
}