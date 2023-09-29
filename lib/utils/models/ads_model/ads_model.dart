import 'package:haraj/utils/models/governorates_model/governorate_model.dart';
import 'package:haraj/utils/models/meta/meta_model.dart';
import 'package:haraj/utils/models/seller_info/image.dart';
import 'package:haraj/utils/models/seller_info/store_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ads_model.g.dart';

@JsonSerializable(explicitToJson: true, createToJson: true, createFactory: true)
class AdsModel {
  @JsonKey(name: "data")
  List<Data>? data;
  @JsonKey(name: "meta")
  Meta? meta;

  AdsModel({this.data, this.meta});

  factory AdsModel.fromJson(Map<String, dynamic> json) =>
      _$AdsModelFromJson(json);

  Map<String, dynamic> toJson() => _$AdsModelToJson(this);
}

@JsonSerializable()
class Data {
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
  GovernorateModel? brand;
  @JsonKey(name: "car_id")
  int? carId;
  @JsonKey(name: "car")
  GovernorateModel? car;
  @JsonKey(name: "body_id")
  int? bodyId;
  @JsonKey(name: "body")
  GovernorateModel? body;
  @JsonKey(name: "mechanical_status_id")
  int? mechanicalStatusId;
  @JsonKey(name: "mechanical_status")
  GovernorateModel? mechanicalStatus;
  @JsonKey(name: "standard_id")
  int? standardId;
  @JsonKey(name: "standard")
  GovernorateModel? standard;
  @JsonKey(name: "general_status_id")
  int? generalStatusId;
  @JsonKey(name: "general_status")
  GovernorateModel? generalStatus;
  @JsonKey(name: "fuel_id")
  int? fuelId;
  @JsonKey(name: "fuel")
  GovernorateModel? fuel;
  @JsonKey(name: "gear_id")
  int? gearId;
  @JsonKey(name: "gear")
  GovernorateModel? gear;
  @JsonKey(name: "driving_side_id")
  int? drivingSideId;
  @JsonKey(name: "driving_side")
  GovernorateModel? drivingSide;
  @JsonKey(name: "seller_type_id")
  int? sellerTypeId;
  @JsonKey(name: "seller_type")
  GovernorateModel? sellerType;
  @JsonKey(name: "technical_advantage_id")
  int? technicalAdvantageId;
  @JsonKey(name: "technical_advantage")
  GovernorateModel? technicalAdvantage;
  @JsonKey(name: "seat_id")
  int? seatId;
  @JsonKey(name: "seat")
  Seat? seat;
  @JsonKey(name: "cylinder_id")
  int? cylinderId;
  @JsonKey(name: "cylinder")
  Seat? cylinder;
  @JsonKey(name: "door_id")
  int? doorId;
  @JsonKey(name: "door")
  Seat? door;
  @JsonKey(name: "category_id")
  int? categoryId;
  @JsonKey(name: "category")
  GovernorateModel? category;
  @JsonKey(name: "year")
  String? year;
  @JsonKey(name: "engine_id")
  int? engineId;
  @JsonKey(name: "engine")
  Seat? engine;
  @JsonKey(name: "distance")
  int? distance;
  @JsonKey(name: "out_color")
  GovernorateModel? outColor;
  @JsonKey(name: "in_color")
  GovernorateModel? inColor;
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
  @JsonKey(name: "created_at")
  String? createdAt;
  Data(
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
      this.createdAt});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);

  @override
  String toString() {
    return 'Data{store: $id}';
  }
}

@JsonSerializable()
class Brand {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;

  Brand({this.id, this.name});

  factory Brand.fromJson(Map<String, dynamic> json) => _$BrandFromJson(json);

  Map<String, dynamic> toJson() => _$BrandToJson(this);
}

@JsonSerializable()
class Seat {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "number")
  int? number;

  Seat({this.id, this.number});

  factory Seat.fromJson(Map<String, dynamic> json) => _$SeatFromJson(json);

  Map<String, dynamic> toJson() => _$SeatToJson(this);
}
