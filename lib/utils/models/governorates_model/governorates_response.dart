import 'package:haraj/utils/models/governorates_model/governorate_model.dart';

import '../../api/process_response.dart';

import 'package:json_annotation/json_annotation.dart';
part 'governorates_response.g.dart';

@JsonSerializable()
class GovernoratesResponse extends ProcessResponse {

  @JsonKey(name: "data")
  List<GovernorateModel>? data;

  GovernoratesResponse({this.data});

  factory GovernoratesResponse.fromJson(Map<String, dynamic> json) =>_$GovernoratesResponseFromJson(json);

  Map<String, dynamic> toJson() =>_$GovernoratesResponseToJson(this);
}



