// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ads_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdsModel _$AdsModelFromJson(Map<String, dynamic> json) => AdsModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AdsModelToJson(AdsModel instance) => <String, dynamic>{
      'data': instance.data?.map((e) => e.toJson()).toList(),
      'meta': instance.meta?.toJson(),
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: json['id'] as int?,
      price: json['price'] as String?,
      sellerId: int.tryParse('${json['seller_id']}'),
      isFavorite: json['is_favorite'] as bool?,
      storeId: int.tryParse('${json['store_id']}'),
      store: json['store'] == null
          ? null
          : Store.fromJson(json['store'] as Map<String, dynamic>),
      brandId: json['brand_id'] as int?,
      brand: json['brand'] == null
          ? null
          : GovernorateModel.fromJson(json['brand'] as Map<String, dynamic>),
      carId: json['car_id'] as int?,
      car: json['car'] == null
          ? null
          : GovernorateModel.fromJson(json['car'] as Map<String, dynamic>),
      bodyId: json['body_id'] as int?,
      body: json['body'] == null
          ? null
          : GovernorateModel.fromJson(json['body'] as Map<String, dynamic>),
      mechanicalStatusId: json['mechanical_status_id'] as int?,
      mechanicalStatus: json['mechanical_status'] == null
          ? null
          : GovernorateModel.fromJson(
              json['mechanical_status'] as Map<String, dynamic>),
      standardId: json['standard_id'] as int?,
      standard: json['standard'] == null
          ? null
          : GovernorateModel.fromJson(json['standard'] as Map<String, dynamic>),
      generalStatusId: json['general_status_id'] as int?,
      generalStatus: json['general_status'] == null
          ? null
          : GovernorateModel.fromJson(
              json['general_status'] as Map<String, dynamic>),
      fuelId: json['fuel_id'] as int?,
      fuel: json['fuel'] == null
          ? null
          : GovernorateModel.fromJson(json['fuel'] as Map<String, dynamic>),
      gearId: json['gear_id'] as int?,
      gear: json['gear'] == null
          ? null
          : GovernorateModel.fromJson(json['gear'] as Map<String, dynamic>),
      drivingSideId: json['driving_side_id'] as int?,
      drivingSide: json['driving_side'] == null
          ? null
          : GovernorateModel.fromJson(
              json['driving_side'] as Map<String, dynamic>),
      sellerTypeId: json['seller_type_id'] as int?,
      sellerType: json['seller_type'] == null
          ? null
          : GovernorateModel.fromJson(
              json['seller_type'] as Map<String, dynamic>),
      technicalAdvantageId: json['technical_advantage_id'] as int?,
      technicalAdvantage: json['technical_advantage'] == null
          ? null
          : GovernorateModel.fromJson(
              json['technical_advantage'] as Map<String, dynamic>),
      seatId: json['seat_id'] as int?,
      seat: json['seat'] == null
          ? null
          : Seat.fromJson(json['seat'] as Map<String, dynamic>),
      cylinderId: json['cylinder_id'] as int?,
      cylinder: json['cylinder'] == null
          ? null
          : Seat.fromJson(json['cylinder'] as Map<String, dynamic>),
      doorId: json['door_id'] as int?,
      door: json['door'] == null
          ? null
          : Seat.fromJson(json['door'] as Map<String, dynamic>),
      categoryId: json['category_id'] as int?,
      category: json['category'] == null
          ? null
          : GovernorateModel.fromJson(json['category'] as Map<String, dynamic>),
      year: json['year'] as int?,
      engineId: json['engine_id'] as int?,
      engine: json['engine'] == null
          ? null
          : Seat.fromJson(json['engine'] as Map<String, dynamic>),
      distance: json['distance'] as int?,
      outColor: json['out_color'] == null
          ? null
          : GovernorateModel.fromJson(
              json['out_color'] as Map<String, dynamic>),
      inColor: json['in_color'] == null
          ? null
          : GovernorateModel.fromJson(json['in_color'] as Map<String, dynamic>),
      details: json['details'] as String?,
      guarantee: json['guarantee'] as bool?,
      finance: json['finance'] as bool?,
      exportable: json['exportable'] as bool?,
      whatsapp: json['whatsapp'] as String?,
      facebook: json['facebook'] as String?,
      whatsappConnection: json['whatsapp_connection'] as bool?,
      facebookConnection: json['facebook_connection'] as bool?,
      call: json['call'] as bool?,
      chat: json['chat'] as bool?,
      gallery: (json['gallery'] as List<dynamic>?)
          ?.map((e) => MyImage.fromJson(e as Map<String, dynamic>))
          .toList(),
      sold: json['sold'] as bool?,
      featured: json['featured'] as bool?,
      status: json['status'] as bool?,
      createdAt: json['created_at'] as String?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'seller_id': instance.sellerId,
      'is_favorite': instance.isFavorite,
      'store_id': instance.storeId,
      'store': instance.store,
      'brand_id': instance.brandId,
      'brand': instance.brand,
      'car_id': instance.carId,
      'car': instance.car,
      'body_id': instance.bodyId,
      'body': instance.body,
      'mechanical_status_id': instance.mechanicalStatusId,
      'mechanical_status': instance.mechanicalStatus,
      'standard_id': instance.standardId,
      'standard': instance.standard,
      'general_status_id': instance.generalStatusId,
      'general_status': instance.generalStatus,
      'fuel_id': instance.fuelId,
      'fuel': instance.fuel,
      'gear_id': instance.gearId,
      'gear': instance.gear,
      'driving_side_id': instance.drivingSideId,
      'driving_side': instance.drivingSide,
      'seller_type_id': instance.sellerTypeId,
      'seller_type': instance.sellerType,
      'technical_advantage_id': instance.technicalAdvantageId,
      'technical_advantage': instance.technicalAdvantage,
      'seat_id': instance.seatId,
      'seat': instance.seat,
      'cylinder_id': instance.cylinderId,
      'cylinder': instance.cylinder,
      'door_id': instance.doorId,
      'door': instance.door,
      'category_id': instance.categoryId,
      'category': instance.category,
      'year': instance.year,
      'engine_id': instance.engineId,
      'engine': instance.engine,
      'distance': instance.distance,
      'out_color': instance.outColor,
      'in_color': instance.inColor,
      'details': instance.details,
      'guarantee': instance.guarantee,
      'finance': instance.finance,
      'exportable': instance.exportable,
      'whatsapp': instance.whatsapp,
      'facebook': instance.facebook,
      'whatsapp_connection': instance.whatsappConnection,
      'facebook_connection': instance.facebookConnection,
      'call': instance.call,
      'chat': instance.chat,
      'gallery': instance.gallery,
      'sold': instance.sold,
      'featured': instance.featured,
      'status': instance.status,
      'created_at': instance.createdAt,
    };

Brand _$BrandFromJson(Map<String, dynamic> json) => Brand(
      id: json['id'] as int?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$BrandToJson(Brand instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

Seat _$SeatFromJson(Map<String, dynamic> json) => Seat(
      id: json['id'] as int?,
      number: json['number'] as int?,
    );

Map<String, dynamic> _$SeatToJson(Seat instance) => <String, dynamic>{
      'id': instance.id,
      'number': instance.number,
    };
