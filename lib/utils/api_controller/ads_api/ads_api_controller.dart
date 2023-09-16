import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:haraj/utils/api/api_settings.dart';
import 'package:haraj/utils/extensions/helpers/helpers.dart';
import 'package:haraj/utils/models/ads_model/ads_model.dart';
import 'package:haraj/utils/models/instruction/instruction_model.dart';
import 'package:haraj/utils/models/offer/offer_model.dart';
import 'package:http/http.dart' as http;

import '../../errors/error_const.dart';
import '../../errors/exceptions.dart';

class AdsApiController with Helpers {
  index({page}) async {
    var url = Uri.parse('${ApiSettings.post}?page=$page');
    http.Response response = await http.get(url, headers: headers);
    var decodedJson = json.decode(response.body);

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

  store({
    price,
    carId,
    brandId,
    bodyId,
    mechanicalStatusId,
    standardId,
    generalStatusId,
    fuelId,
    gearId,
    drivingSideId,
    sellerTypeId,
    technicalAdvantageId,
    seatId,
    cylinderId,
    doorId,
    year,
    engineId,
    distance,
    outColor,
    inColor,
    details,
    guarantee,
    finance,
    exportable,
    whatsapp,
    facebook,
    whatsappConnection,
    facebookConnection,
    call,
    chat,
  }) async {
    var map = {
      "price": price,
      "car_id": carId,
      "brand_id": brandId,
      "body_id": bodyId,
      "mechanical_status_id": mechanicalStatusId,
      "standard_id": standardId,
      "general_status_id": generalStatusId,
      "fuel_id": fuelId,
      "gear_id": gearId,
      "driving_side_id": drivingSideId,
      "seller_type_id": sellerTypeId,
      "technical_advantage_id": technicalAdvantageId,
      "seat_id": seatId,
      "cylinder_id": cylinderId,
      "door_id": doorId,
      "year": year,
      "engine_id": engineId,
      "distance": distance,
      "out_color": outColor,
      "in_color": inColor,
      "details": details,
      "guarantee": guarantee,
      "finance": finance,
      "exportable": exportable,
      "whatsapp": whatsapp,
      "facebook": facebook,
      "whatsapp_connection": whatsappConnection,
      "facebook_connection": facebookConnection,
      "call": call,
      "chat": chat,
    };
    var url = Uri.parse(ApiSettings.post);
    http.Response response = await http.post(url, body: map, headers: headers);
    var decodedJson = json.decode(response.body);

    debugPrint("mmm post 💯=> $decodedJson");
    if (response.statusCode == 200) {
      return AdsModel.fromJson(decodedJson);
    } else {
      SERVER_FAILURE_MESSAGE = decodedJson['message'];
      throw ServerException();
    }
  }

  offers({
    postId,
    amount,
  }) async {
    var map = {
      "post_id": postId,
      "amount": amount,
    };
    var url = Uri.parse(ApiSettings.offers);
    http.Response response = await http.post(url, body: map, headers: headers);
    var decodedJson = json.decode(response.body);

    debugPrint("mmm offers 💯=> $decodedJson");
    if (response.statusCode == 200) {
      return OfferModel.fromJson(decodedJson['data']);
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
}
