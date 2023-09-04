// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'governorates_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GovernoratesResponse _$GovernoratesResponseFromJson(
        Map<String, dynamic> json) =>
    GovernoratesResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => GovernorateModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..status = json['status'] as bool?
      ..message = json['message'] as String?;

Map<String, dynamic> _$GovernoratesResponseToJson(
        GovernoratesResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
