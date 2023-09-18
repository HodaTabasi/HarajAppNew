import 'package:haraj/utils/models/meta/meta_model.dart';
import 'package:haraj/utils/models/offer/offer_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'main_offer_model.g.dart';

@JsonSerializable(explicitToJson: true, createToJson: true, createFactory: true)
class MainOfferModel {
  @JsonKey(name: "data")
  List<OfferModel>? data;
  @JsonKey(name: "meta")
  Meta? meta;

  MainOfferModel({this.data, this.meta});

  factory MainOfferModel.fromJson(Map<String, dynamic> json) =>
      _$MainOfferModelFromJson(json);

  Map<String, dynamic> toJson() => _$MainOfferModelToJson(this);
}
