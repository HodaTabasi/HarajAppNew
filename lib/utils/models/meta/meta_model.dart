import 'package:json_annotation/json_annotation.dart';

part 'meta_model.g.dart';

@JsonSerializable(explicitToJson: true, createToJson: true, createFactory: true)
class Meta {
  @JsonKey(name: "current_page")
  int? currentPage;
  @JsonKey(name: "from")
  int? from;
  @JsonKey(name: "last_page")
  int? lastPage;
  @JsonKey(name: "path")
  String? path;
  @JsonKey(name: "per_page")
  int? perPage;
  @JsonKey(name: "to")
  int? to;
  @JsonKey(name: "total")
  int? total;

  Meta(
      {this.currentPage,
      this.from,
      this.lastPage,
      this.path,
      this.perPage,
      this.to,
      this.total});

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);

  Map<String, dynamic> toJson() => _$MetaToJson(this);
}
