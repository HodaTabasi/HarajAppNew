import 'package:haraj/utils/api/process_response.dart';
import 'package:json_annotation/json_annotation.dart';
part 'verify_response.g.dart';

@JsonSerializable()
class verifiyResponse extends ProcessResponse{
  @JsonKey(name: "data")
  Data? data;

  verifiyResponse(this.data);

  factory verifiyResponse.fromJson(Map<String, dynamic> json) =>_$verifiyResponseFromJson(json);

  Map<String, dynamic> toJson() =>_$verifiyResponseToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(name: "id")
  String? id;

  Data(this.id);

  factory Data.fromJson(Map<String, dynamic> json) =>_$DataFromJson(json);

  Map<String, dynamic> toJson() =>_$DataToJson(this);
}
