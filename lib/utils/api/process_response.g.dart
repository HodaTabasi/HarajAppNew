// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'process_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProcessResponse _$ProcessResponseFromJson(Map<String, dynamic> json) =>
    ProcessResponse()
      ..status = json['status'] as bool?
      ..message = json['message'] as String?;

Map<String, dynamic> _$ProcessResponseToJson(ProcessResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };
