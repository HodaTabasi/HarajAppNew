import 'package:json_annotation/json_annotation.dart';
part 'image.g.dart';

@JsonSerializable()
class MyImage {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "image")
  String? image;

  MyImage(this.id, this.image);

  factory MyImage.fromJson(Map<String, dynamic> json) =>_$MyImageFromJson(json);
  //
  Map<String, dynamic> toJson() =>_$MyImageToJson(this);
}
