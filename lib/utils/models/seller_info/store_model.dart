import 'package:haraj/utils/models/seller_info/image.dart';

import 'address_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'store_model.g.dart';

@JsonSerializable()
class Store {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "avatar")
  String? avatar;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "mobile")
  String? mobile;
  @JsonKey(name: "commercial_register")
  String? commercialRegister;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "description")
  String? description;
  @JsonKey(name: "address")
  Address? address;
  @JsonKey(name: "gallery")
  List<MyImage>? gallery;

  Store(
      {this.id,
      this.avatar,
      this.name,
      this.mobile,
      this.commercialRegister,
      this.email,
      this.description,
      this.address,
      this.gallery});

  factory Store.fromJson(Map<String,dynamic> json) =>_$StoreFromJson(json);

  Map<String,dynamic> toJson() => _$StoreToJson(this);
}