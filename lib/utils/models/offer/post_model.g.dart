// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostModel _$PostModelFromJson(Map<String, dynamic> json) => PostModel(
      id: json['id'] as int?,
      price: json['price'] as String?,
      sellerId: json['seller_id'] as int?,
      isFavorite: json['is_favorite'] as bool?,
      storeId: json['store_id'] as int?,
      store: json['store'] == null
          ? null
          : Store.fromJson(json['store'] as Map<String, dynamic>),
      brandId: json['brand_id'] as int?,
      brand: json['brand'] == null
          ? null
          : GeneralModel.fromJson(json['brand'] as Map<String, dynamic>),
      carId: json['car_id'] as int?,
      car: json['car'] == null
          ? null
          : GeneralModel.fromJson(json['car'] as Map<String, dynamic>),
      bodyId: json['body_id'] as int?,
      body: json['body'] == null
          ? null
          : GeneralModel.fromJson(json['body'] as Map<String, dynamic>),
      mechanicalStatusId: json['mechanical_status_id'] as int?,
      mechanicalStatus: json['mechanical_status'] == null
          ? null
          : GeneralModel.fromJson(
              json['mechanical_status'] as Map<String, dynamic>),
      standardId: json['standard_id'] as int?,
      standard: json['standard'] == null
          ? null
          : GeneralModel.fromJson(json['standard'] as Map<String, dynamic>),
      generalStatusId: json['general_status_id'] as int?,
      generalStatus: json['general_status'] == null
          ? null
          : GeneralModel.fromJson(
              json['general_status'] as Map<String, dynamic>),
      fuelId: json['fuel_id'] as int?,
      fuel: json['fuel'] == null
          ? null
          : GeneralModel.fromJson(json['fuel'] as Map<String, dynamic>),
      gearId: json['gear_id'] as int?,
      gear: json['gear'] == null
          ? null
          : GeneralModel.fromJson(json['gear'] as Map<String, dynamic>),
      drivingSideId: json['driving_side_id'] as int?,
      drivingSide: json['driving_side'] == null
          ? null
          : GeneralModel.fromJson(json['driving_side'] as Map<String, dynamic>),
      sellerTypeId: json['seller_type_id'] as int?,
      sellerType: json['seller_type'] == null
          ? null
          : GeneralModel.fromJson(json['seller_type'] as Map<String, dynamic>),
      technicalAdvantageId: json['technical_advantage_id'] as int?,
      technicalAdvantage: json['technical_advantage'] == null
          ? null
          : GeneralModel.fromJson(
              json['technical_advantage'] as Map<String, dynamic>),
      seatId: json['seat_id'] as int?,
      seat: json['seat'] == null
          ? null
          : GeneralModel.fromJson(json['seat'] as Map<String, dynamic>),
      cylinderId: json['cylinder_id'] as int?,
      cylinder: json['cylinder'] == null
          ? null
          : GeneralModel.fromJson(json['cylinder'] as Map<String, dynamic>),
      doorId: json['door_id'] as int?,
      door: json['door'] == null
          ? null
          : GeneralModel.fromJson(json['door'] as Map<String, dynamic>),
      categoryId: json['category_id'] as int?,
      category: json['category'] == null
          ? null
          : GeneralModel.fromJson(json['category'] as Map<String, dynamic>),
      year: json['year'] as String?,
      engineId: json['engine_id'] as int?,
      engine: json['engine'] == null
          ? null
          : GeneralModel.fromJson(json['engine'] as Map<String, dynamic>),
      distance: json['distance'] as int?,
      outColor: json['out_color'] == null
          ? null
          : GeneralModel.fromJson(json['out_color'] as Map<String, dynamic>),
      inColor: json['in_color'] == null
          ? null
          : GeneralModel.fromJson(json['in_color'] as Map<String, dynamic>),
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
      viewsCount: json['views_count'] as String?,
      createdAt: json['created_at'] as String?,
    );

Map<String, dynamic> _$PostModelToJson(PostModel instance) => <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'seller_id': instance.sellerId,
      'is_favorite': instance.isFavorite,
      'store_id': instance.storeId,
      'store': instance.store?.toJson(),
      'brand_id': instance.brandId,
      'brand': instance.brand?.toJson(),
      'car_id': instance.carId,
      'car': instance.car?.toJson(),
      'body_id': instance.bodyId,
      'body': instance.body?.toJson(),
      'mechanical_status_id': instance.mechanicalStatusId,
      'mechanical_status': instance.mechanicalStatus?.toJson(),
      'standard_id': instance.standardId,
      'standard': instance.standard?.toJson(),
      'general_status_id': instance.generalStatusId,
      'general_status': instance.generalStatus?.toJson(),
      'fuel_id': instance.fuelId,
      'fuel': instance.fuel?.toJson(),
      'gear_id': instance.gearId,
      'gear': instance.gear?.toJson(),
      'driving_side_id': instance.drivingSideId,
      'driving_side': instance.drivingSide?.toJson(),
      'seller_type_id': instance.sellerTypeId,
      'seller_type': instance.sellerType?.toJson(),
      'technical_advantage_id': instance.technicalAdvantageId,
      'technical_advantage': instance.technicalAdvantage?.toJson(),
      'seat_id': instance.seatId,
      'seat': instance.seat?.toJson(),
      'cylinder_id': instance.cylinderId,
      'cylinder': instance.cylinder?.toJson(),
      'door_id': instance.doorId,
      'door': instance.door?.toJson(),
      'category_id': instance.categoryId,
      'category': instance.category?.toJson(),
      'year': instance.year,
      'engine_id': instance.engineId,
      'engine': instance.engine?.toJson(),
      'distance': instance.distance,
      'out_color': instance.outColor?.toJson(),
      'in_color': instance.inColor?.toJson(),
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
      'gallery': instance.gallery?.map((e) => e.toJson()).toList(),
      'sold': instance.sold,
      'featured': instance.featured,
      'status': instance.status,
      'views_count': instance.viewsCount,
      'created_at': instance.createdAt,
    };
