// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'general_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeneralModel _$GeneralModelFromJson(Map<String, dynamic> json) => GeneralModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      number: json['number'] as int?,
      cars: (json['cars'] as List<dynamic>?)
          ?.map((e) => GeneralModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GeneralModelToJson(GeneralModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'number': instance.number,
      'cars': instance.cars?.map((e) => e.toJson()).toList(),
    };
