// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_properties.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CarProperties _$CarPropertiesFromJson(Map<String, dynamic> json) =>
    CarProperties(
      brands: (json['brands'] as List<dynamic>?)
          ?.map((e) => GeneralModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => GeneralModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      fuels: (json['fuels'] as List<dynamic>?)
          ?.map((e) => GeneralModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      bodies: (json['bodies'] as List<dynamic>?)
          ?.map((e) => GeneralModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      standards: (json['standards'] as List<dynamic>?)
          ?.map((e) => GeneralModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      colors: (json['colors'] as List<dynamic>?)
          ?.map((e) => GeneralModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      generalStatuses: (json['general-statuses'] as List<dynamic>?)
          ?.map((e) => GeneralModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      mechanicalStatuses: (json['mechanical-statuses'] as List<dynamic>?)
          ?.map((e) => GeneralModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      gears: (json['gears'] as List<dynamic>?)
          ?.map((e) => GeneralModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      drivingSides: (json['driving-sides'] as List<dynamic>?)
          ?.map((e) => GeneralModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      technicalAdvantages: (json['technical-advantages'] as List<dynamic>?)
          ?.map((e) => GeneralModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      seats: (json['seats'] as List<dynamic>?)
          ?.map((e) => GeneralModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      doors: (json['doors'] as List<dynamic>?)
          ?.map((e) => GeneralModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      cylinders: (json['cylinders'] as List<dynamic>?)
          ?.map((e) => GeneralModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      engines: (json['engines'] as List<dynamic>?)
          ?.map((e) => GeneralModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..status = json['status'] as bool?
      ..message = json['message'] as String?;

Map<String, dynamic> _$CarPropertiesToJson(CarProperties instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'brands': instance.brands,
      'categories': instance.categories,
      'fuels': instance.fuels,
      'bodies': instance.bodies,
      'standards': instance.standards,
      'colors': instance.colors,
      'general-statuses': instance.generalStatuses,
      'mechanical-statuses': instance.mechanicalStatuses,
      'gears': instance.gears,
      'driving-sides': instance.drivingSides,
      'technical-advantages': instance.technicalAdvantages,
      'seats': instance.seats,
      'doors': instance.doors,
      'cylinders': instance.cylinders,
      'engines': instance.engines,
    };
