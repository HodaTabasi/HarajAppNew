// part 'post_model.g.dart';

class AdsModel {
  int? id;

  AdsModel({this.id});

  AdsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    return data;
  }
}
