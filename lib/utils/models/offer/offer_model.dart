import 'package:haraj/utils/models/offer/client_model.dart';
import 'package:haraj/utils/models/offer/post_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'offer_model.g.dart';

@JsonSerializable(explicitToJson: true, createToJson: true, createFactory: true)
class OfferModel {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "amount")
  int? amount;
  @JsonKey(name: "client_id")
  int? clientId;
  @JsonKey(name: "post_id")
  int? postId;
  @JsonKey(name: "client")
  ClientModel? client;
  @JsonKey(name: "post")
  PostModel? post;
  @JsonKey(name: "created_at")
  String? createdAt;

  OfferModel(
      {this.id,
      this.status,
      this.amount,
      this.clientId,
      this.postId,
      this.client,
      this.post,
      this.createdAt});

  factory OfferModel.fromJson(Map<String, dynamic> json) =>
      _$OfferModelFromJson(json);

  Map<String, dynamic> toJson() => _$OfferModelToJson(this);
}
