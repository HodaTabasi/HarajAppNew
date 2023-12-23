import 'dart:convert';

import 'package:haraj/utils/models/general/general_model.dart';
import 'package:haraj/utils/models/seller_info/image.dart';
import 'package:haraj/utils/models/seller_info/store_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post_model.g.dart';

@JsonSerializable(explicitToJson: true, createToJson: true, createFactory: true)
class PostModel {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "price")
  String? price;
  @JsonKey(name: "seller_id")
  int? sellerId;
  @JsonKey(name: "is_favorite")
  bool? isFavorite;
  @JsonKey(name: "store_id")
  int? storeId;
  @JsonKey(name: "store")
  Store? store;
  @JsonKey(name: "brand_id")
  int? brandId;
  @JsonKey(name: "brand")
  GeneralModel? brand;
  @JsonKey(name: "car_id")
  int? carId;
  @JsonKey(name: "car")
  GeneralModel? car;
  @JsonKey(name: "body_id")
  int? bodyId;
  @JsonKey(name: "body")
  GeneralModel? body;
  @JsonKey(name: "mechanical_status_id")
  int? mechanicalStatusId;
  @JsonKey(name: "mechanical_status")
  GeneralModel? mechanicalStatus;
  @JsonKey(name: "standard_id")
  int? standardId;
  @JsonKey(name: "standard")
  GeneralModel? standard;
  @JsonKey(name: "general_status_id")
  int? generalStatusId;
  @JsonKey(name: "general_status")
  GeneralModel? generalStatus;
  @JsonKey(name: "fuel_id")
  int? fuelId;
  @JsonKey(name: "fuel")
  GeneralModel? fuel;
  @JsonKey(name: "gear_id")
  int? gearId;
  @JsonKey(name: "gear")
  GeneralModel? gear;
  @JsonKey(name: "driving_side_id")
  int? drivingSideId;
  @JsonKey(name: "driving_side")
  GeneralModel? drivingSide;
  @JsonKey(name: "seller_type_id")
  int? sellerTypeId;
  @JsonKey(name: "seller_type")
  GeneralModel? sellerType;
  @JsonKey(name: "technical_advantage_id")
  int? technicalAdvantageId;
  @JsonKey(name: "technical_advantage")
  GeneralModel? technicalAdvantage;
  @JsonKey(name: "seat_id")
  int? seatId;
  @JsonKey(name: "seat")
  GeneralModel? seat;
  @JsonKey(name: "cylinder_id")
  int? cylinderId;
  @JsonKey(name: "cylinder")
  GeneralModel? cylinder;
  @JsonKey(name: "door_id")
  int? doorId;
  @JsonKey(name: "door")
  GeneralModel? door;
  @JsonKey(name: "category_id")
  int? categoryId;
  @JsonKey(name: "category")
  GeneralModel? category;
  @JsonKey(name: "year")
  int? year;
  @JsonKey(name: "engine_id")
  int? engineId;
  @JsonKey(name: "engine")
  GeneralModel? engine;
  @JsonKey(name: "distance")
  int? distance;
  @JsonKey(name: "out_color")
  GeneralModel? outColor;
  @JsonKey(name: "in_color")
  GeneralModel? inColor;
  @JsonKey(name: "details")
  String? details;
  @JsonKey(name: "guarantee")
  bool? guarantee;
  @JsonKey(name: "finance")
  bool? finance;
  @JsonKey(name: "exportable")
  bool? exportable;
  @JsonKey(name: "whatsapp")
  String? whatsapp;
  @JsonKey(name: "facebook")
  String? facebook;
  @JsonKey(name: "whatsapp_connection")
  bool? whatsappConnection;
  @JsonKey(name: "facebook_connection")
  bool? facebookConnection;
  @JsonKey(name: "call")
  bool? call;
  @JsonKey(name: "chat")
  bool? chat;
  @JsonKey(name: "gallery")
  List<MyImage>? gallery;
  @JsonKey(name: "sold")
  bool? sold;
  @JsonKey(name: "featured")
  bool? featured;
  @JsonKey(name: "status")
  bool? status;
  @JsonKey(name: "views_count")
  String? viewsCount;
  @JsonKey(name: "created_at")
  String? createdAt;

  PostModel(
      {this.id,
      this.price,
      this.sellerId,
      this.isFavorite,
      this.storeId,
      this.store,
      this.brandId,
      this.brand,
      this.carId,
      this.car,
      this.bodyId,
      this.body,
      this.mechanicalStatusId,
      this.mechanicalStatus,
      this.standardId,
      this.standard,
      this.generalStatusId,
      this.generalStatus,
      this.fuelId,
      this.fuel,
      this.gearId,
      this.gear,
      this.drivingSideId,
      this.drivingSide,
      this.sellerTypeId,
      this.sellerType,
      this.technicalAdvantageId,
      this.technicalAdvantage,
      this.seatId,
      this.seat,
      this.cylinderId,
      this.cylinder,
      this.doorId,
      this.door,
      this.categoryId,
      this.category,
      this.year,
      this.engineId,
      this.engine,
      this.distance,
      this.outColor,
      this.inColor,
      this.details,
      this.guarantee,
      this.finance,
      this.exportable,
      this.whatsapp,
      this.facebook,
      this.whatsappConnection,
      this.facebookConnection,
      this.call,
      this.chat,
      this.gallery,
      this.sold,
      this.featured,
      this.status,
      this.viewsCount,
      this.createdAt});

  factory PostModel.fromJson(Map<String, dynamic> json) =>
      _$PostModelFromJson(json);

  Map<String, dynamic> toJson() => _$PostModelToJson(this);
}
