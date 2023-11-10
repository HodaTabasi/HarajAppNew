import 'package:haraj/utils/models/offer/client_model.dart';
import 'package:haraj/utils/models/offer/post_model.dart';

class ChatConversation {
  ChatConversation({
      this.id, 
      this.client, 
      this.post,
      this.lastMessageContent,
      this.lastMessageCreatedAt, 
      this.status,});

  ChatConversation.fromJson(dynamic json) {
    id = json['id'];
    client = json['client'] != null ? ClientModel.fromJson(json['client']) : null;
    post = json['post'] != null ? PostModel.fromJson(json['post']) : null;
    lastMessageContent = json['last_message_content'];
    lastMessageCreatedAt = json['last_message_created_at'];
    status = json['status'];
  }
  num? id;
  ClientModel? client;
  PostModel? post;
  String? lastMessageContent;
  String? lastMessageCreatedAt;
  bool? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    if (client != null) {
      map['client'] = client?.toJson();
    }
    if (post != null) {
      map['post'] = post?.toJson();
    }
    map['last_message_content'] = lastMessageContent;
    map['last_message_created_at'] = lastMessageCreatedAt;
    map['status'] = status;
    return map;
  }

}