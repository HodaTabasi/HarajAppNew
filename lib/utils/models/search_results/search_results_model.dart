import 'package:haraj/utils/models/search_results/search_results_item_model.dart';

import '../meta/meta_model.dart';
import 'Links.dart';
import 'dart:convert';

SearchResultsModel searchResultsFromJson(String str) => SearchResultsModel.fromJson(json.decode(str));
String searchResultsToJson(SearchResultsModel data) => json.encode(data.toJson());
class SearchResultsModel {
  SearchResultsModel({
      List<SearchResultsItemModel>? data,
      Links? links, 
      Meta? meta,}){
    _data = data;
    _links = links;
    _meta = meta;
}

  SearchResultsModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(SearchResultsItemModel.fromJson(v));
      });
    }
    _links = json['links'] != null ? Links.fromJson(json['links']) : null;
    _meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }
  List<SearchResultsItemModel>? _data;
  Links? _links;
  Meta? _meta;
SearchResultsModel copyWith({  List<SearchResultsItemModel>? data,
  Links? links,
  Meta? meta,
}) => SearchResultsModel(  data: data ?? _data,
  links: links ?? _links,
  meta: meta ?? _meta,
);
  List<SearchResultsItemModel>? get data => _data;
  Links? get links => _links;
  Meta? get meta => _meta;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    if (_links != null) {
      map['links'] = _links?.toJson();
    }
    if (_meta != null) {
      map['meta'] = _meta?.toJson();
    }
    return map;
  }

}