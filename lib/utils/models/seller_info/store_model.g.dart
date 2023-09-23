// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Store _$StoreFromJson(Map<String, dynamic> json) => Store(
      id: json['id'] as int?,
      avatar: json['avatar'] as String?,
      name: json['name'] as String?,
      mobile: json['mobile'] as String?,
      commercialRegister: json['commercial_register'] as String?,
      email: json['email'] as String?,
      description: json['description'] as String?,
      address: json['address'] == null
          ? null
          : Address.fromJson(json['address'] as Map<String, dynamic>),
      gallery: (json['gallery'] as List<dynamic>?)
          ?.map((e) => MyImage.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..commercialRegisterImage = json['commercial_register_image'] as String?
      ..postsLeft = json['posts_left'] as int?
      ..numberOfPosts = json['number_of_posts'] as int?;

Map<String, dynamic> _$StoreToJson(Store instance) => <String, dynamic>{
      'id': instance.id,
      'avatar': instance.avatar,
      'name': instance.name,
      'mobile': instance.mobile,
      'commercial_register': instance.commercialRegister,
      'commercial_register_image': instance.commercialRegisterImage,
      'email': instance.email,
      'description': instance.description,
      'address': instance.address,
      'gallery': instance.gallery,
      'posts_left': instance.postsLeft,
      'number_of_posts': instance.numberOfPosts,
    };
