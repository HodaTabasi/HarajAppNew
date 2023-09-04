import 'dart:convert';

import 'package:haraj/utils/extensions/helpers/helpers.dart';
import 'package:haraj/utils/models/user/user_model.dart';
import 'package:haraj/utils/models/seller_info/verify_response.dart';
import 'package:haraj/utils/prefs/shared_pref_controller.dart';
import 'package:http/http.dart' as http;

import '../api/api_settings.dart';
import '../errors/error_const.dart';
import '../errors/exceptions.dart';

class AuthController with Helpers{

  login({email,password}) async {
    var map = {
    "email":email,
    "password":password,
    "device_name": await getId()
    };
    var url = Uri.parse(ApiSettings.login);
    http.Response response = await http.post(url,body: map,headers: headers);
    var  decodedJson = json.decode(response.body);

    print(decodedJson);
    if (response.statusCode == 200) {
      // GetStorage().write('otp', decodedJson['otp_code']);
      return UserModel.fromJson(decodedJson);
    } else {
      SERVER_FAILURE_MESSAGE = decodedJson['message'] ;
      throw ServerException();
    }
  }

  registration({email,password,type}) async {
    var map = {
      "email":email,
      "password":password,
      "type":type,
    };
    var url = Uri.parse(ApiSettings.register);
    http.Response response = await http.post(url,body: map,headers: headers);
    var  decodedJson = json.decode(response.body);

    print(decodedJson);
    if (response.statusCode == 201) {

      // GetStorage().write('otp', decodedJson['otp_code']);
      return verifiyResponse.fromJson(decodedJson);
    } else {
      SERVER_FAILURE_MESSAGE = decodedJson['message'] ;
      throw ServerException();
    }

  }

  verify({code,hashKey}) async {
    var map = {
      "code":code,
      "device_name": await getId()
    };
    var url = Uri.parse(ApiSettings.verify.replaceFirst('{id}',hashKey));
    http.Response response = await http.post(url,body: map);
    var  decodedJson = json.decode(response.body);

    print(decodedJson);
    if (response.statusCode == 200) {
      // GetStorage().write('otp', decodedJson['otp_code']);
      return UserModel.fromJson(decodedJson);
    } else {
      SERVER_FAILURE_MESSAGE = decodedJson['message'] ;
      throw ServerException();
    }
  }

  reSendVerify({email}) async {
    var map = {
      "email":email,
    };
    var url = Uri.parse(ApiSettings.reSendVerify);
    http.Response response = await http.post(url,body: map);

    var  decodedJson = json.decode(response.body);

    print(decodedJson);
    if (response.statusCode == 200) {
      // GetStorage().write('otp', decodedJson['otp_code']);
      return verifiyResponse.fromJson(decodedJson);
    } else {
      SERVER_FAILURE_MESSAGE = decodedJson['message'] ;
      throw ServerException();
    }
  }

  socialLogin({deviceName,name,googleProvider,twitterProvider,facebookProvider,avatar}) async {
    var map = {
    "device_name":deviceName,
    "name":name,
    "google_provider_id":googleProvider,
    "twitter_provider_id":twitterProvider,
    "facebook_provider_id":facebookProvider,
    "avatar":avatar,
    };
    var url = Uri.parse(ApiSettings.socialLogin);
    http.Response response = await http.post(url,body: map);
  }
}