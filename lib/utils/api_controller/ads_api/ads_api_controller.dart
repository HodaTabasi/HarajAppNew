import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:haraj/utils/api/api_settings.dart';
import 'package:haraj/utils/extensions/helpers/helpers.dart';
import 'package:haraj/utils/models/ads_model/ads_model.dart';
import 'package:http/http.dart' as http;

import '../../errors/error_const.dart';
import '../../errors/exceptions.dart';

class AdsApiController with Helpers {
  index() async {
    var url = Uri.parse(ApiSettings.index);
    http.Response response = await http.get(url, headers: headers);
    var decodedJson = json.decode(response.body);

    debugPrint("mmm 💯=> $decodedJson");
    if (response.statusCode == 200) {
      return AdsModel.fromJson(decodedJson);
    } else {
      SERVER_FAILURE_MESSAGE = decodedJson['message'];
      throw ServerException();
    }
  }

  show(int id) async {
    // Add id as a query parameter
    var url = Uri.parse('${ApiSettings.index}/$id');
    http.Response response = await http.get(url, headers: headers);
    var decodedJson = json.decode(response.body);

    debugPrint("mmm show 💯=> $decodedJson");
    if (response.statusCode == 200) {
      return AdsModel.fromJson(decodedJson);
    } else {
      SERVER_FAILURE_MESSAGE = decodedJson['message'];
      throw ServerException();
    }
  }
}
