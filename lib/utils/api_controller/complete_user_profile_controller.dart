import 'dart:convert';
import 'dart:io';

import 'package:haraj/utils/extensions/helpers/helpers.dart';
import 'package:haraj/utils/models/user/user_model.dart';
import 'package:haraj/utils/prefs/shared_pref_controller.dart';

import '../api/api_settings.dart';

import 'package:http/http.dart' as http;

import '../errors/error_const.dart';
import '../errors/exceptions.dart';
import '../models/seller_info/seller_user_model.dart';
import '../models/seller_info/store_model.dart';

class CompleteUserProfileController with Helpers {

  updatePersonalInfo({required SellerUserModel userModel,required path}) async {
    var url = Uri.parse(ApiSettings.updatePersonalData);

    var request = http.MultipartRequest('POST', url);
    http.MultipartFile imageFile =
    await http.MultipartFile.fromPath('avatar', path);
    request.files.add(imageFile);
    request.headers[HttpHeaders.acceptHeader] = 'application/json';
    request.headers[HttpHeaders.authorizationHeader] = SharedPrefController().token;
    request.headers[HttpHeaders.acceptLanguageHeader] = SharedPrefController().language;
    request.fields['ssn'] = userModel.ssn ??"";
    request.fields['mobile'] = userModel.mobile!;
    request.fields['nick_name'] = userModel.nickName ?? "";
    request.fields['name'] = userModel.name!;
    request.fields['type'] = SharedPrefController().type.toString();

    var response = await request.send();
    var body = await response.stream.transform(utf8.decoder).first;
    var decodedJson = jsonDecode(body);

    print(decodedJson);
    print(response.statusCode);
    if (response.statusCode == 200) {
      // GetStorage().write('otp', decodedJson['otp_code']);
      return UserModel.fromJson(decodedJson);
    } else {
      SERVER_FAILURE_MESSAGE = decodedJson['message'] ;
      throw ServerException();
    }
  }

  updateStoreInfo({required Store store,required path}) async {
    var url = Uri.parse(ApiSettings.updateStoreData);

    var request = http.MultipartRequest('POST', url);
    http.MultipartFile imageFile =
    await http.MultipartFile.fromPath('avatar', path);
    request.files.add(imageFile);
    request.headers[HttpHeaders.acceptHeader] = 'application/json';
    request.headers[HttpHeaders.authorizationHeader] = SharedPrefController().token;
    request.headers[HttpHeaders.acceptLanguageHeader] = SharedPrefController().language;
    request.fields['name'] = store.name ??"";
    request.fields['email'] = store.email!;
    request.fields['mobile'] = store.mobile ?? "";
    request.fields['commercial_register'] = store.commercialRegister!;
    request.fields['description'] = store.description ?? "";


    var response = await request.send();
    var body = await response.stream.transform(utf8.decoder).first;
    var decodedJson = jsonDecode(body);

    print(decodedJson);
    print(response.statusCode);
    if (response.statusCode == 200) {
      // GetStorage().write('otp', decodedJson['otp_code']);
      return UserModel.fromJson(decodedJson);
    } else {
      SERVER_FAILURE_MESSAGE = decodedJson['message'] ;
      throw ServerException();
    }
  }
}