import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:haraj/utils/api/api_settings.dart';
import 'package:haraj/utils/errors/error_const.dart';
import 'package:haraj/utils/errors/exceptions.dart';
import 'package:haraj/utils/extensions/helpers/helpers.dart';
import 'package:haraj/utils/models/offer/main_offer_model.dart';
import 'package:haraj/utils/models/offer/offer_model.dart';
import 'package:haraj/utils/prefs/shared_pref_controller.dart';
import 'package:http/http.dart' as http;

class OfferApiController with Helpers {
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

  showPostOffers({postId, page}) async {
    var url = Uri.parse("${ApiSettings.post}/$postId/offers?page=$page");
    http.Response response = await http.get(url, headers: headers);
    var decodedJson = json.decode(response.body);

    debugPrint("mmm showPostOffers 💯=> $postId");
    debugPrint("mmm showPostOffers 💯=> $decodedJson");
    if (response.statusCode == 200) {
      return MainOfferModel.fromJson(decodedJson);
    } else {
      SERVER_FAILURE_MESSAGE = decodedJson['message'];
      throw ServerException();
    }
  }

  showPostNewOffers({page}) async {
    var url = Uri.parse("${ApiSettings.offers}/new?page=$page");
    http.Response response = await http.get(url, headers: headers);
    var decodedJson = json.decode(response.body);

    debugPrint("mmm showPostNewOffers 💯=> $decodedJson");
    if (response.statusCode == 200) {
      return MainOfferModel.fromJson(decodedJson);
    } else {
      SERVER_FAILURE_MESSAGE = decodedJson['message'];
      throw ServerException();
    }
  }

  showPostRejectedOffers({page}) async {
    var url = Uri.parse("${ApiSettings.offers}/rejected?page=$page");
    http.Response response = await http.get(url, headers: headers);
    var decodedJson = json.decode(response.body);

    debugPrint("mmm showPostRejectedOffers 💯=> $decodedJson");
    if (response.statusCode == 200) {
      return MainOfferModel.fromJson(decodedJson);
    } else {
      SERVER_FAILURE_MESSAGE = decodedJson['message'];
      throw ServerException();
    }
  }

  showPostAcceptedOffers({page}) async {
    var url = Uri.parse("${ApiSettings.offers}/accepted?page=$page");
    http.Response response = await http.get(url, headers: headers);
    var decodedJson = json.decode(response.body);

    debugPrint("mmm acceptOffers 💯=> ${SharedPrefController().token}");
    debugPrint("mmm showPostAcceptedOffers 💯=> $decodedJson");
    if (response.statusCode == 200) {
      return MainOfferModel.fromJson(decodedJson);
    } else {
      SERVER_FAILURE_MESSAGE = decodedJson['message'];
      throw ServerException();
    }
  }

  acceptOffers({postId}) async {
    var url = Uri.parse("${ApiSettings.offers}/$postId/accept");
    http.Response response = await http.patch(url, headers: headers);
    var decodedJson = json.decode(response.body);

    debugPrint("mmm acceptOffers 💯=> $decodedJson");
    if (response.statusCode == 200) {
      return OfferModel.fromJson(decodedJson);
    } else {
      SERVER_FAILURE_MESSAGE = decodedJson['message'];
      throw ServerException();
    }
  }

  rejectOffers({postId}) async {
    var url = Uri.parse("${ApiSettings.offers}/$postId/reject");
    http.Response response = await http.patch(url, headers: headers);
    var decodedJson = json.decode(response.body);

    debugPrint("mmm rejectOffers 💯=> $decodedJson");
    if (response.statusCode == 200) {
      return OfferModel.fromJson(decodedJson);
    } else {
      SERVER_FAILURE_MESSAGE = decodedJson['message'];
      throw ServerException();
    }
  }
}
