import 'package:haraj/utils/models/meta/meta_model.dart';
import 'package:haraj/utils/models/offer/post_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'store_post_model.g.dart';

@JsonSerializable(explicitToJson: true, createToJson: true, createFactory: true)
class StorePostModel {
  @JsonKey(name: "data")
  List<PostModel>? data;
  @JsonKey(name: "meta")
  Meta? meta;

  StorePostModel({this.data, this.meta});

  factory StorePostModel.fromJson(Map<String, dynamic> json) =>
      _$StorePostModelFromJson(json);

  Map<String, dynamic> toJson() => _$StorePostModelToJson(this);
}
