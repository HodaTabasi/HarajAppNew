import 'dart:convert';

import 'package:http/http.dart' as http;

import '../api/api_settings.dart';
import '../errors/error_const.dart';
import '../errors/exceptions.dart';
import '../extensions/helpers/helpers.dart';
import '../models/governorates_model/governorates_response.dart';

class GeneralApiController with Helpers {

  getGovernorates() async {
    var url = Uri.parse(ApiSettings.governorates);
    http.Response response = await http.get(url,headers: headers);
    var  decodedJson = json.decode(response.body);

    print(decodedJson);
    if (response.statusCode == 200) {

      // GetStorage().write('otp', decodedJson['otp_code']);
      return GovernoratesResponse.fromJson(decodedJson);
    } else {
      SERVER_FAILURE_MESSAGE = decodedJson['message'] ;
      throw ServerException();
    }
  }



}