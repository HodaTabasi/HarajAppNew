// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
      (json['lat'] as num?)?.toDouble(),
      (json['lng'] as num?)?.toDouble(),
      json['street'] as String?,
      json['city_id'] as int?,
      json['post_code'] as String?,
      json['building_no'] as String?,
      json['governorate_id'] as int?,
    );

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
      'street': instance.street,
      'city_id': instance.cityId,
      'post_code': instance.postCode,
      'building_no': instance.buildingNo,
      'governorate_id': instance.governorateId,
    };
