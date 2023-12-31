import 'dart:convert';
import 'dart:io';

import 'package:haraj/utils/api/api_settings.dart';
import 'package:haraj/utils/extensions/helpers/helpers.dart';
import 'package:haraj/utils/models/ads_model/ads_model.dart';
import 'package:haraj/utils/models/general/general_model.dart';
import 'package:haraj/utils/models/instruction/instruction_model.dart';
import 'package:http/http.dart' as http;

import '../../api/api_response.dart';
import '../../errors/error_const.dart';
import '../../errors/exceptions.dart';
import '../../models/car_properties/car_properties.dart';
import '../../models/seller_info/image.dart';
import '../../prefs/shared_pref_controller.dart';

class AdsApiController with Helpers {
  index({page}) async {
    var url = Uri.parse('${ApiSettings.post}?page=$page');
    http.Response response = await http.get(url, headers: headers);
    var decodedJson = json.decode(response.body);

    print("mmm ads Headers 💯=> $headers");
    print("mmm ads  💯=> $decodedJson");
    print("mmm ads  💯=> ${response.statusCode}");

    if (response.statusCode == 200) {
      return AdsModel.fromJson(decodedJson);
    } else {
      SERVER_FAILURE_MESSAGE = decodedJson['message'];
      throw ServerException();
    }
  }

  show(id) async {
    // Add id as a query parameter
    var url = Uri.parse('${ApiSettings.post}/$id');
    http.Response response = await http.get(url, headers: headers);
    var decodedJson = json.decode(response.body);

    if (response.statusCode == 200) {
      return Data.fromJson(decodedJson['data']);
    } else {
      SERVER_FAILURE_MESSAGE = decodedJson['message'];
      throw ServerException();
    }
  }

  instruction() async {
    var url = Uri.parse(ApiSettings.instruction);
    http.Response response = await http.get(url, headers: headers);
    var decodedJson = json.decode(response.body);

    if (response.statusCode == 200) {
      return InstructionModel.fromJson(decodedJson);
    } else {
      SERVER_FAILURE_MESSAGE = decodedJson['message'];
      throw ServerException();
    }
  }

  carProperties() async {
    var url = Uri.parse(ApiSettings.getProperties);
    http.Response response = await http.get(url, headers: headers);
    var decodedJson = json.decode(response.body);

    if (response.statusCode == 200) {
      return CarProperties.fromJson(decodedJson);
    } else {
      SERVER_FAILURE_MESSAGE = decodedJson['message'];
      throw ServerException();
    }
  }

  addAds(
      {required List<MyImage> images,
      required Map<String, GeneralModel> selectedData,
      required price,
      required year,
      required kelometer,
      required details}) async {
    var url = Uri.parse(ApiSettings.addAds);
    var request = http.MultipartRequest('POST', url);

    for (int i = 0; i < images.length; i++) {
      http.MultipartFile imageFile = await http.MultipartFile.fromPath(
          'gallery[$i]', images[i].image ?? '');
      request.files.add(imageFile);
    }

    request.headers[HttpHeaders.acceptHeader] = 'application/json';
    request.headers[HttpHeaders.authorizationHeader] =
        SharedPrefController().token;
    request.headers[HttpHeaders.acceptLanguageHeader] =
        SharedPrefController().language;

    selectedData.forEach((key, value) {
      if ((key == 'guarantee' || key == 'finance' || key == 'exportable') &&
          value.id == null) {
        request.fields[key] = '0';
      } else {
        request.fields[key] = value.id.toString();
      }
    });

    request.fields['distance'] = kelometer.toString();
    request.fields['year'] = year.toString();
    request.fields['details'] = details.toString();
    request.fields['price'] = price.toString();
    request.fields['whatsapp_connection'] = "0";
    request.fields['facebook_connection'] = "0";
    request.fields['call'] = "0";
    request.fields['chat'] = "0";

    var response = await request.send();
    var body = await response.stream.transform(utf8.decoder).first;
    var decodedJson = jsonDecode(body);

    print(decodedJson);
    print(response.statusCode);
    if (response.statusCode == 201) {
      // GetStorage().write('otp', decodedJson['otp_code']);
      return Data.fromJson(decodedJson['data']);
    } else {
      SERVER_FAILURE_MESSAGE = decodedJson['message'];
      throw ServerException();
    }
  }

  addSocialContactToAds(
      {whatsapp,
      facebook,
      whatsappConnection,
      facebookConnection,
      call,
      chat,
      postId}) async {
    print("object");
    var map = {
      'whatsapp': '$whatsapp',
      'facebook': '$facebook',
      'whatsapp_connection': '$whatsappConnection',
      'facebook_connection': '$facebookConnection',
      'call': '$call',
      'chat': '$chat',
    };
    var url = Uri.parse('${ApiSettings.addAds}/$postId');
    http.Response response = await http.post(url, headers: headers, body: map);
    print(response.body);
    print(response.statusCode);
    print(SharedPrefController().token);
    var decodedJson = json.decode(response.body);

    if (response.statusCode == 200) {
      return Data.fromJson(decodedJson['data']);
    } else {
      SERVER_FAILURE_MESSAGE = decodedJson['message'];
      throw ServerException();
    }
  }

  toggleFavorite({postId}) async {
    var url =
        Uri.parse('${ApiSettings.toggleFavorite}/$postId/toggle-favorite');
    http.Response response = await http.post(url, headers: headers);
    var decodedJson = json.decode(response.body);

    if (response.statusCode == 200) {
      return ApiResponse.fromJson(decodedJson);
    } else {
      SERVER_FAILURE_MESSAGE = decodedJson['reason'];
      throw ServerException();
    }
  }
}
