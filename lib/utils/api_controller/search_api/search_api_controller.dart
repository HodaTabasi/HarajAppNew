import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:haraj/feature/app/dashboard/buyer/dashboard_buyer/views/bn_screens/search_buyer/controllers/search_buyer_controller.dart';
import 'package:haraj/utils/api/api_settings.dart';
import 'package:haraj/utils/extensions/helpers/helpers.dart';
import 'package:haraj/utils/models/ads_model/ads_model.dart';
import 'package:http/http.dart' as http;

import '../../errors/error_const.dart';
import '../../errors/exceptions.dart';
import '../../models/car_properties/car_properties.dart';

class SearchApiController with Helpers {
  static SearchBuyerController get to => Get.find<SearchBuyerController>();

  index({fuelId,cityId,governorateId,brandId,keyword, page}) async {
    var url = Uri.parse('${ApiSettings.post}?page=$page&fuel_id=$fuelId&city_id=$cityId&governorate_id=$governorateId&brand_id=$brandId&keywords=$keyword');
    http.Response response = await http.get(url, headers: headers);
    var decodedJson = json.decode(response.body);

    print("mmm search ads Headers 💯=> $url");
    print("mmm search ads Headers 💯=> $headers");
    print("mmm search ads  💯=> $decodedJson");
    print("mmm search ads  💯=> ${response.statusCode}");

    if (response.statusCode == 200) {
      return AdsModel.fromJson(decodedJson);
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

}
