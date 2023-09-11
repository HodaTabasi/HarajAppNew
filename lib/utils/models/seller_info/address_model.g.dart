// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
      lat: json['lat'] as String?,
      lng: json['lng'] as String?,
      street: json['street'] as String?,
      cityId: json['city_id'] as String?,
      postCode: json['post_code'] as String?,
      buildingNo: json['building_no'] as String?,
      governorateId: json['governorate_id'] as String?,
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
