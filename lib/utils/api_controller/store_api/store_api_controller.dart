import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:haraj/utils/api/api_response.dart';
import 'package:haraj/utils/api/api_settings.dart';
import 'package:haraj/utils/extensions/helpers/helpers.dart';
import 'package:haraj/utils/models/store_post/store_post_model.dart';
import 'package:http/http.dart' as http;

import '../../errors/error_const.dart';
import '../../errors/exceptions.dart';

class StoreApiController with Helpers {
  storePost({id, page}) async {
    var url = Uri.parse('${ApiSettings.stores}/$id/posts?page=$page');
    http.Response response = await http.get(url, headers: headers);
    var decodedJson = json.decode(response.body);

    debugPrint("mmm storePost 💯=> $decodedJson");

    if (response.statusCode == 200) {
      return StorePostModel.fromJson(decodedJson);
    } else {
      SERVER_FAILURE_MESSAGE = decodedJson['message'];
      throw ServerException();
    }
  }

  destroyPost({id}) async {
    var url = Uri.parse('${ApiSettings.post}/$id');
    http.Response response = await http.delete(url, headers: headers);
    var decodedJson = json.decode(response.body);

    debugPrint("mmm destroyPost 💯=> $decodedJson");

    if (response.statusCode == 200) {
      return ApiResponse.fromJson(decodedJson);
    } else {
      SERVER_FAILURE_MESSAGE = decodedJson['message'];
      throw ServerException();
    }
  }
}
