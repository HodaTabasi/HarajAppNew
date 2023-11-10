import 'package:haraj/utils/models/chat/chat_conversation.dart';
import 'package:haraj/utils/models/meta/meta_model.dart';

class ChatsModel {
  ChatsModel({
    this.data,
    this.meta,});

  ChatsModel.fromJson(dynamic json) {
    data =  (json['data'] as List<dynamic>?)
        ?.map((e) => ChatConversation.fromJson(e as Map<String, dynamic>))
        .toList();
    meta = json['meta'] == null
    ? null
        : Meta.fromJson(json['meta'] as Map<String, dynamic>);
  }
  List<ChatConversation>? data;
  Meta? meta;


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (meta != null) {
      map['meta'] = meta?.toJson();
    }
    map['data'] = data?.map((e) => e.toJson()).toList();
    return map;
  }

}