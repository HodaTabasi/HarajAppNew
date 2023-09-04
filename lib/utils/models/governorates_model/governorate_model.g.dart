// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'governorate_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GovernorateModel _$GovernorateModelFromJson(Map<String, dynamic> json) =>
    GovernorateModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      cities: (json['cities'] as List<dynamic>?)
          ?.map((e) => CityModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GovernorateModelToJson(GovernorateModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'cities': instance.cities,
    };
