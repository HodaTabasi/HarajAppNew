import 'dart:convert';

import 'package:haraj/utils/models/search_results/search_results_model.dart';

SearchResultsItemModel dataFromJson(String str) => SearchResultsItemModel.fromJson(json.decode(str));
String dataToJson(SearchResultsItemModel data) => json.encode(data.toJson());
class SearchResultsItemModel {
  SearchResultsItemModel({
    int? id,
      String? content,}){
    _id = id;
    _content = content;
}

  SearchResultsItemModel.fromJson(dynamic json) {
    _id = json['id'];
    _content = json['content'];
  }
  int? _id;
  String? _content;
  SearchResultsItemModel copyWith({  int? id,
  String? content,
}) => SearchResultsItemModel(  id: id ?? _id,
  content: content ?? _content,
);
  int? get id => _id;
  String? get content => _content;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['content'] = _content;
    return map;
  }

}