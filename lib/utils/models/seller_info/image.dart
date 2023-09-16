import 'package:json_annotation/json_annotation.dart';
part 'image.g.dart';

@JsonSerializable()
class MyImage {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "image")
  String? image;

  bool? isSelected;
  bool? fromFile;

  MyImage(this.id, this.image,[this.fromFile = false,this.isSelected = false]);

  factory MyImage.fromJson(Map<String, dynamic> json) =>_$MyImageFromJson(json);
  //
  Map<String, dynamic> toJson() =>_$MyImageToJson(this);
}
