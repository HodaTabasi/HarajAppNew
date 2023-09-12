import 'package:json_annotation/json_annotation.dart';

import '../governorates_model/citiey_model.dart';

part 'address_model.g.dart';

@JsonSerializable()
class Address {
  @JsonKey(name: "lat")
  double? lat;
  @JsonKey(name: "lng")
  double? lng;
  @JsonKey(name: "street")
  String? street;
  @JsonKey(name: "city_id")
  int? cityId;
  @JsonKey(name: "post_code")
  String? postCode;
  @JsonKey(name: "building_no")
  String? buildingNo;
  @JsonKey(name: "governorate_id")
  int? governorateId;
  @JsonKey(name: "governorate")
  CityModel? governorate;
  @JsonKey(name: "city")
  CityModel? city;

  //
  Address(
      {this.lat,
      this.lng,
      this.street,
      this.cityId,
      this.postCode,
      this.buildingNo,
      this.governorateId,
      this.city,
      this.governorate});

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddressToJson(this);

  @override
  String toString() {
    return 'Address{lat: $lat, lng: $lng, street: $street, cityId: $cityId, postCode: $postCode, buildingNo: $buildingNo, governorateId: $governorateId}';
  }
//
  // Address.fromJson(Map<String, dynamic> json) {
  //   lat = json['lat'];
  //   lng = json['lng'];
  //   street = json['street'];
  //   cityId = json['city_id'];
  //   postCode = json['post_code'];
  //   buildingNo = json['building_no'];
  //   governorateId = json['governorate_id'];
  // }
  //
  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['lat'] = this.lat;
  //   data['lng'] = this.lng;
  //   data['street'] = this.street;
  //   data['city_id'] = this.cityId;
  //   data['post_code'] = this.postCode;
  //   data['building_no'] = this.buildingNo;
  //   data['governorate_id'] = this.governorateId;
  //   return data;
  // }
}
