import 'dart:convert';

import 'package:haraj/utils/api/api_settings.dart';
import 'package:haraj/utils/extensions/helpers/helpers.dart';
import 'package:haraj/utils/models/chat/chats_model.dart';
import 'package:haraj/utils/models/chat/messages_model.dart';
import 'package:http/http.dart' as http;

import '../../errors/error_const.dart';
import '../../errors/exceptions.dart';
import '../../models/chat/Message.dart';

class ChatsApiController with Helpers {
  index({page}) async {
    var url = Uri.parse('${ApiSettings.chats}?page=$page');
    http.Response response = await http.get(url, headers: headers);
    var decodedJson = json.decode(response.body);

    print("mmm chat Headers 💯=> $headers");
    print("mmm chat  💯=> $decodedJson");
    print("mmm chat  💯=> ${response.statusCode}");

    if (response.statusCode == 200) {
      return ChatsModel.fromJson(decodedJson);
    } else {
      SERVER_FAILURE_MESSAGE = decodedJson['message'];
      throw ServerException();
    }
  }
  chatDetails({page, required id}) async {
    var url = Uri.parse('${ApiSettings.chats}/$id/messages?page=$page');
    http.Response response = await http.get(url, headers: headers);
    var decodedJson = json.decode(response.body);

    print("mmm chatDetails Headers 💯=> $headers");
    print("mmm chatDetails  💯=> $decodedJson");
    print("mmm chatDetails  💯=> ${response.statusCode}");

    if (response.statusCode == 200) {
      return MessagesModel.fromJson(decodedJson);
    } else {
      SERVER_FAILURE_MESSAGE = decodedJson['message'];
      throw ServerException();
    }
  }
  sendMessage({required id, required content}) async {
    var url = Uri.parse('${ApiSettings.chats}/$id/messages');
    http.Response response = await http.post(url, headers: headers, body: {'content' : content});
    var decodedJson = json.decode(response.body);

    print("mmm sendMessage Headers 💯=> $headers");
    print("mmm sendMessage  💯=> $decodedJson");
    print("mmm sendMessage  💯=> ${response.statusCode}");

    if (response.statusCode == 201 || response.statusCode == 200) {
      return Message.fromJson(decodedJson['data']);
    } else {
      SERVER_FAILURE_MESSAGE = decodedJson['message'];
      throw ServerException();
    }
  }


  // show(id) async {
  //   // Add id as a query parameter
  //   var url = Uri.parse('${ApiSettings.post}/$id');
  //   http.Response response = await http.get(url, headers: headers);
  //   var decodedJson = json.decode(response.body);
  //
  //   if (response.statusCode == 200) {
  //     return Data.fromJson(decodedJson['data']);
  //   } else {
  //     SERVER_FAILURE_MESSAGE = decodedJson['message'];
  //     throw ServerException();
  //   }
  // }

  // toggleFavorite({postId}) async {
  //   var url = Uri.parse('${ApiSettings.toggleFavorite}/$postId/toggle-favorite');
  //   http.Response response = await http.post(url, headers: headers);
  //   var decodedJson = json.decode(response.body);
  //
  //   if (response.statusCode == 200) {
  //     return ApiResponse.fromJson(decodedJson);
  //   } else {
  //     SERVER_FAILURE_MESSAGE = decodedJson['reason'];
  //     throw ServerException();
  //   }
  // }
}
