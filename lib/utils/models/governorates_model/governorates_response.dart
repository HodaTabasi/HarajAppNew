import 'package:haraj/utils/models/governorates_model/governorate_model.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../api/process_response.dart';

part 'governorates_response.g.dart';

@JsonSerializable()
class GovernoratesResponse extends ProcessResponse {
  @JsonKey(name: "data")
  List<GovernorateModel>? data;

  GovernoratesResponse({this.data});

  factory GovernoratesResponse.fromJson(Map<String, dynamic> json) =>
      _$GovernoratesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GovernoratesResponseToJson(this);
}
