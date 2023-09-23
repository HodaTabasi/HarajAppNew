// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_offer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MainOfferModel _$MainOfferModelFromJson(Map<String, dynamic> json) =>
    MainOfferModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => OfferModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MainOfferModelToJson(MainOfferModel instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e.toJson()).toList(),
      'meta': instance.meta?.toJson(),
    };
