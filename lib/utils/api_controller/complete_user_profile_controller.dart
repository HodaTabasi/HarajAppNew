import 'dart:convert';
import 'dart:io';

import 'package:haraj/utils/extensions/helpers/helpers.dart';
import 'package:haraj/utils/models/seller_info/address_model.dart' as address;
import 'package:haraj/utils/models/user/user_model.dart';
import 'package:haraj/utils/prefs/shared_pref_controller.dart';

import '../api/api_settings.dart';

import 'package:http/http.dart' as http;

import '../errors/error_const.dart';
import '../errors/exceptions.dart';
import '../models/seller_info/image.dart';
import '../models/seller_info/seller_user_model.dart';
import '../models/seller_info/store_model.dart';

class CompleteUserProfileController with Helpers {

  updatePersonalInfo({required SellerUserModel userModel, path}) async {
    var url = Uri.parse(ApiSettings.updatePersonalData);
    var decodedJson;
    var response;
    if(path == null){
      var map = {
      'ssn':userModel.ssn ??"",
      'mobile':userModel.mobile!,
      'nick_name':userModel.nickName ?? "",
      'name': userModel.name!,
      'type':SharedPrefController().type.toString()
    };
      response = await http.post(url,body: map,headers:headers);
      decodedJson = jsonDecode(response.body);

    }else {
      var request = http.MultipartRequest('POST', url);
      http.MultipartFile imageFile =
      await http.MultipartFile.fromPath('avatar', path);
      request.files.add(imageFile);
      request.headers['Accept'] = 'application/json';
      request.headers['Content-Type'] = 'application/json';
      request.headers['Authorization'] = SharedPrefController().token;
      request.headers['Accept-Language'] = SharedPrefController().language;
      request.fields['ssn'] = userModel.ssn ??"";
      request.fields['mobile'] = userModel.mobile!;
      request.fields['nick_name'] = userModel.nickName ?? "";
      request.fields['name'] = userModel.name!;
      request.fields['type'] = SharedPrefController().type.toString();

      response = await request.send();
      var body = await response.stream.transform(utf8.decoder).first;
      decodedJson = jsonDecode(body);
    }


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

  updateStoreInfo({required Store store,path}) async {
    var url = Uri.parse(ApiSettings.updateStoreData);
    var response;
    var decodedJson;

    if(path == null){
      var map = {
      'name': store.name ??"",
      'email': store.email!,
      'mobile':store.mobile ?? "",
      'commercial_register': store.commercialRegister!,
      'description': store.description ?? ""
      };
        response = await http.post(url,body: map,headers: headers);
        decodedJson = jsonDecode(response.body);
    }else {
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

      response = await request.send();
      var body = await response.stream.transform(utf8.decoder).first;
      decodedJson = jsonDecode(body);
    }

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

  updateAddressInfo({required  address.Address address}) async {
      var map = {
        "governorate_id":address.governorateId.toString(),
        "city_id":address.cityId.toString(),
        "lat":address.lat.toString(),
        "lng":address.lng.toString(),
        "street":address.street,
        "building_no":address.buildingNo,
        "post_code":address.postCode
      };
      var url = Uri.parse(ApiSettings.updateAddress);
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

  updateStoreImage({required List<MyImage> images}) async {
    var url = Uri.parse(ApiSettings.updateStoreData);
    var response;
    var decodedJson;


      var request = http.MultipartRequest('POST', url);
      for(int i = 0;i<images.length;i++){
        http.MultipartFile imageFile =
        await http.MultipartFile.fromPath('gallery[$i]', images[i].image??'');
        request.files.add(imageFile);
      }

      request.headers[HttpHeaders.acceptHeader] = 'application/json';
      request.headers[HttpHeaders.authorizationHeader] = SharedPrefController().token;
      request.headers[HttpHeaders.acceptLanguageHeader] = SharedPrefController().language;

      response = await request.send();
      var body = await response.stream.transform(utf8.decoder).first;
      decodedJson = jsonDecode(body);


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