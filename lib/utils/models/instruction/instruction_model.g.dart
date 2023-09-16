// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'instruction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InstructionModel _$InstructionModelFromJson(Map<String, dynamic> json) =>
    InstructionModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => GeneralModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$InstructionModelToJson(InstructionModel instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e.toJson()).toList(),
    };
