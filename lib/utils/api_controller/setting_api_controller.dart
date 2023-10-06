import 'dart:convert';

import 'package:haraj/utils/api/api_response.dart';

import '../api/api_settings.dart';
import '../errors/error_const.dart';
import '../errors/exceptions.dart';
import '../extensions/helpers/helpers.dart';
import '../models/user/user_model.dart';
import 'package:http/http.dart' as http;

import '../prefs/shared_pref_controller.dart';

class SettingApiController with Helpers{

  updateEmail({email}) async {
    var url = Uri.parse(ApiSettings.updatePersonalData);
    var decodedJson;
    var response;

      var map = {
        'email':email ??"",
        'type':SharedPrefController().type.toString()
      };
      response = await http.post(url,body: map,headers:headers);
      decodedJson = jsonDecode(response.body);


    if (response.statusCode == 200) {
      return UserModel.fromJson(decodedJson);
    } else {
      SERVER_FAILURE_MESSAGE = decodedJson['message'] ;
      throw ServerException();
    }
  }
  updatePassword({password,confirmPassword,currentPassword}) async {
    var url = Uri.parse(ApiSettings.updatePersonalData);
    var decodedJson;
    var response;

    var map = {
      'password':password ??"",
      'password_confirmation':confirmPassword ??"",
      'current_password':currentPassword ??"",
      'type':SharedPrefController().type.toString()
    };
    response = await http.post(url,body: map,headers:headers);
    decodedJson = jsonDecode(response.body);


    if (response.statusCode == 200) {
      return UserModel.fromJson(decodedJson);
    } else {
      SERVER_FAILURE_MESSAGE = decodedJson['message'] ;
      throw ServerException();
    }
  }

  logoutAccount() async {
    var url = Uri.parse(ApiSettings.logout);
    var decodedJson;
    var response;

    print(headers);
    response = await http.post(url,headers:headers);
    decodedJson = jsonDecode(response.body);

    print(response.body);
    if (response.statusCode == 200) {
      return ApiResponse.fromJson(decodedJson);
    } else {
      SERVER_FAILURE_MESSAGE = decodedJson['message'] ;
      throw ServerException();
    }
  }

  deleteAccount({email,password}) async {
    var url = Uri.parse(ApiSettings.deleteAccount);
    var decodedJson;
    var response;

    response = await http.delete(url,headers:headers);
    decodedJson = jsonDecode(response.body);


    if (response.statusCode == 200) {
      return ApiResponse.fromJson(decodedJson);
    } else {
      SERVER_FAILURE_MESSAGE = decodedJson['message'] ;
      throw ServerException();
    }
  }
}