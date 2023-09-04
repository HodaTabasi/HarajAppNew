// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

verifiyResponse _$verifiyResponseFromJson(Map<String, dynamic> json) =>
    verifiyResponse(
      json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..status = json['status'] as bool?
      ..message = json['message'] as String?;

Map<String, dynamic> _$verifiyResponseToJson(verifiyResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      json['id'] as String?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
    };
