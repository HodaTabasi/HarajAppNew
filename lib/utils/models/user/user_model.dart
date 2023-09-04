import '../../api/process_response.dart';
import '../seller_info/seller_user_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends ProcessResponse {
  @JsonKey(name:"data")
  SellerUserModel? data;

  UserModel(this.data);

  factory UserModel.fromJson(Map<String,dynamic> json) =>_$UserModelFromJson(json);

  Map<String,dynamic> toJson() => _$UserModelToJson(this);
}
