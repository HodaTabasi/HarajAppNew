// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StorePostModel _$StorePostModelFromJson(Map<String, dynamic> json) =>
    StorePostModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => PostModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StorePostModelToJson(StorePostModel instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e.toJson()).toList(),
      'meta': instance.meta?.toJson(),
    };
