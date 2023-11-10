import 'package:haraj/utils/models/offer/client_model.dart';

class Message {
  Message({
      this.id, 
      this.content, 
      this.isMine = false,
      this.client,
      this.createdAt,
      this.sending = false
  });

  Message.fromJson(dynamic json) {
    id = json['id'];
    content = json['content'];
    isMine = json['is_mine'] ?? false;
    client = json['client_id'] != null ? ClientModel.fromJson(json['client_id']) : null;
    createdAt = json['created_at'];
  }
  num? id;
  String? content;
  bool isMine = false;
  ClientModel? client;
  String? createdAt;
  bool sending = false;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['content'] = content;
    map['is_mine'] = isMine;
    if (client != null) {
      map['client_id'] = client?.toJson();
    }
    map['created_at'] = createdAt;
    return map;
  }

}
