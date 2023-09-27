import 'package:haraj/utils/models/seller_info/image.dart';
import 'package:json_annotation/json_annotation.dart';

import 'address_model.dart';

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
  @JsonKey(name: "commercial_register_image")
  String? commercialRegisterImage;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "description")
  String? description;
  @JsonKey(name: "address")
  Address? address;
  @JsonKey(name: "gallery")
  List<MyImage>? gallery;
  @JsonKey(name: "posts_left")
  int? postsLeft;
  @JsonKey(name: "number_of_posts")
  int? numberOfPosts;

  Store(
      {this.id,
      this.avatar,
      this.name,
      this.mobile,
      this.commercialRegister,
      this.commercialRegisterImage,
      this.email,
      this.description,
      this.address,
      this.gallery,
      this.postsLeft,
      this.numberOfPosts});

  factory Store.fromJson(Map<String, dynamic> json) => _$StoreFromJson(json);

  Map<String, dynamic> toJson() => _$StoreToJson(this);

  @override
  String toString() {
    return 'Store{id: $id, avatar: $avatar, name: $name, mobile: $mobile, commercialRegister: $commercialRegister, commercialRegisterImage: $commercialRegisterImage, email: $email, description: $description, address: $address, gallery: $gallery, postsLeft: $postsLeft, numberOfPosts: $numberOfPosts}';
  }
}
