import 'package:json_annotation/json_annotation.dart';

part 'client_model.g.dart';

@JsonSerializable(explicitToJson: true, createToJson: true, createFactory: true)
class ClientModel {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "avatar")
  String? avatar;

  ClientModel({this.id, this.name, this.email, this.avatar});

  factory ClientModel.fromJson(Map<String, dynamic> json) =>
      _$ClientModelFromJson(json);

  Map<String, dynamic> toJson() => _$ClientModelToJson(this);
}
