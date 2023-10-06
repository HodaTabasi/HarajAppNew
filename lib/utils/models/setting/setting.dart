import 'package:json_annotation/json_annotation.dart';

part 'setting.g.dart';

@JsonSerializable(explicitToJson: true, createToJson: true, createFactory: true)

class SettingModel {

  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "mobile")
  String? mobile;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "facebook")
  String? facebook;
  @JsonKey(name: "instagram")
  String? instagram;
  @JsonKey(name: "twitter")
  String? twitter;
  @JsonKey(name: "whatsapp")
  String? whatsapp;
  @JsonKey(name: "telegram")
  String? telegram;
  @JsonKey(name: "about_us")
  String? aboutUs;
  @JsonKey(name: "about_app")
  String? aboutApp;
  @JsonKey(name: "privacy")
  String? privacy;
  @JsonKey(name: "usage_conditions")
  String? usageConditions;

  SettingModel(
      {this.title,
        this.mobile,
        this.email,
        this.facebook,
        this.instagram,
        this.twitter,
        this.whatsapp,
        this.telegram,
        this.aboutUs,
        this.aboutApp,
        this.privacy,
        this.usageConditions});

  factory SettingModel.fromJson(Map<String, dynamic> json) => _$SettingModelFromJson(json);

  Map<String, dynamic> toJson()=>_$SettingModelToJson(this);

  @override
  String toString() {
    return 'SettingModel{title: $title, mobile: $mobile, email: $email, facebook: $facebook, instagram: $instagram, twitter: $twitter, whatsapp: $whatsapp, telegram: $telegram, aboutUs: $aboutUs, aboutApp: $aboutApp, privacy: $privacy, usageConditions: $usageConditions}';
  }
}