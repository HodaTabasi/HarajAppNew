// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setting.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SettingModel _$SettingModelFromJson(Map<String, dynamic> json) => SettingModel()
  ..title = json['title'] as String?
  ..mobile = json['mobile'] as String?
  ..email = json['email'] as String?
  ..facebook = json['facebook'] as String?
  ..instagram = json['instagram'] as String?
  ..twitter = json['twitter'] as String?
  ..whatsapp = json['whatsapp'] as String?
  ..telegram = json['telegram'] as String?
  ..aboutUs = json['about_us'] as String?
  ..aboutApp = json['about_app'] as String?
  ..privacy = json['privacy'] as String?
  ..usageConditions = json['usage_conditions'] as String?;

Map<String, dynamic> _$SettingModelToJson(SettingModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'mobile': instance.mobile,
      'email': instance.email,
      'facebook': instance.facebook,
      'instagram': instance.instagram,
      'twitter': instance.twitter,
      'whatsapp': instance.whatsapp,
      'telegram': instance.telegram,
      'about_us': instance.aboutUs,
      'about_app': instance.aboutApp,
      'privacy': instance.privacy,
      'usage_conditions': instance.usageConditions,
    };
