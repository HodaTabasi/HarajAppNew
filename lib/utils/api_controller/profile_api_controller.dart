
import 'dart:convert';

import 'package:haraj/utils/extensions/helpers/helpers.dart';
import 'package:http/http.dart' as http;

import '../api/api_settings.dart';
import '../errors/error_const.dart';
import '../errors/exceptions.dart';
import '../models/user/user_model.dart';

class ProfileApiController with Helpers{
  getProfile() async {
    var url = Uri.parse(ApiSettings.getProfile);
    http.Response response = await http.get(url, headers: headers);
    var decodedJson = json.decode(response.body);

    print(decodedJson);
    if (response.statusCode == 200) {
      return UserModel.fromJson(decodedJson);
    } else {
      SERVER_FAILURE_MESSAGE = decodedJson['message'];
      throw ServerException();
    }
  }
}