// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OfferModel _$OfferModelFromJson(Map<String, dynamic> json) => OfferModel(
      id: json['id'] as int?,
      status: json['status'] as int?,
      amount: json['amount'] as int?,
      clientId: json['client_id'] as int?,
      postId: json['post_id'] as int?,
      client: json['client'] == null
          ? null
          : ClientModel.fromJson(json['client'] as Map<String, dynamic>),
      post: json['post'] == null
          ? null
          : PostModel.fromJson(json['post'] as Map<String, dynamic>),
      createdAt: json['created_at'] as String?,
    );

Map<String, dynamic> _$OfferModelToJson(OfferModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'amount': instance.amount,
      'client_id': instance.clientId,
      'post_id': instance.postId,
      'client': instance.client?.toJson(),
      'post': instance.post?.toJson(),
      'created_at': instance.createdAt,
    };
