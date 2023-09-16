// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyImage _$MyImageFromJson(Map<String, dynamic> json) => MyImage(
      json['id'] as int?,
      json['image'] as String?,
      json['fromFile'] as bool? ?? false,
      json['isSelected'] as bool? ?? false,
    );

Map<String, dynamic> _$MyImageToJson(MyImage instance) => <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'isSelected': instance.isSelected,
      'fromFile': instance.fromFile,
    };
