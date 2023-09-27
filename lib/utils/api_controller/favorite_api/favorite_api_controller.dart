import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:haraj/utils/api/api_settings.dart';
import 'package:haraj/utils/extensions/helpers/helpers.dart';
import 'package:haraj/utils/models/offer/post_model.dart';
import 'package:haraj/utils/models/store_post/store_post_model.dart';
import 'package:http/http.dart' as http;

import '../../errors/error_const.dart';
import '../../errors/exceptions.dart';

class FavoriteApiController with Helpers {
  getFavoriteAds({page}) async {
    var url = Uri.parse('${ApiSettings.post}/favorites?page=$page');
    http.Response response = await http.get(url, headers: headers);
    var decodedJson = json.decode(response.body);

    debugPrint("mmm favoritePost 💯=> $decodedJson");

    if (response.statusCode == 200) {
      return StorePostModel.fromJson(decodedJson);
    } else {
      SERVER_FAILURE_MESSAGE = decodedJson['message'];
      throw ServerException();
    }
  }

  postFavoriteAds({id}) async {
    var url = Uri.parse('${ApiSettings.addFavorite}/$id/toggle-favorite');
    http.Response response = await http.post(url, headers: headers);
    var decodedJson = json.decode(response.body);

    debugPrint("mmm postFavoriteAds 💯=> $decodedJson");

    if (response.statusCode == 200) {
      return PostModel.fromJson(decodedJson);
    } else {
      SERVER_FAILURE_MESSAGE = decodedJson['message'];
      throw ServerException();
    }
  }
}
