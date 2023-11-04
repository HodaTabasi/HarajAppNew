// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seller_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SellerUserModel _$SellerUserModelFromJson(Map<String, dynamic> json) =>
    SellerUserModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      avatar: json['avatar'] as String?,
      type: int.tryParse('${json['type'] ?? 2}'),
      ssn: json['ssn'] as String?,
      mobile: json['mobile'] as String?,
      nickName: json['nick_name'] as String?,
      token: json['token'] as String?,
      emailVerifiedAt: json['email_verified_at'] as String?,
      status: json['status'] as int?,
      store: json['store'] == null
          ? null
          : Store.fromJson(json['store'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SellerUserModelToJson(SellerUserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'avatar': instance.avatar,
      'type': instance.type,
      'ssn': instance.ssn,
      'mobile': instance.mobile,
      'nick_name': instance.nickName,
      'token': instance.token,
      'email_verified_at': instance.emailVerifiedAt,
      'status': instance.status,
      'store': instance.store,
    };
