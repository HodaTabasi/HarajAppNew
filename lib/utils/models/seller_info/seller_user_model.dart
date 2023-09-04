import 'package:haraj/utils/models/seller_info/store_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'seller_user_model.g.dart';

@JsonSerializable()
class SellerUserModel {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "avatar")
  String? avatar;
  @JsonKey(name: "type")
  int? type;
  @JsonKey(name: "ssn")
  String? ssn;
  @JsonKey(name: "mobile")
  String? mobile;
  @JsonKey(name: "nick_name")
  String? nickName;
  @JsonKey(name: "token")
  String? token;
  @JsonKey(name: "email_verified_at")
  String? emailVerifiedAt;
  @JsonKey(name: "status")
  int ? status;
  @JsonKey(name: "store")
  Store? store;

  SellerUserModel(
      {this.id,
      this.name,
      this.email,
      this.avatar,
      this.type,
      this.ssn,
      this.mobile,
      this.nickName,
      this.token,
      this.emailVerifiedAt,
      this.status,
      this.store});

  factory SellerUserModel.fromJson(Map<String,dynamic> json) =>_$SellerUserModelFromJson(json);

  Map<String,dynamic> toJson() => _$SellerUserModelToJson(this);
}




