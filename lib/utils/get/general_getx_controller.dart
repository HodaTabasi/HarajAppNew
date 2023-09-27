import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:haraj/utils/repository/general_repo.dart';

import '../errors/error_const.dart';
import '../extensions/color_resource/color_resource.dart';

class GeneralGetxController extends GetxController {
  RxString mobile = RxString('');
  Rx<String?> mobileErrorText  = RxString('');
  Rx<String?> idErrorText  = RxString('');
  Rx<String?> emailErrorText  = RxString('');
  Rx<String?> passwordErrorText  = RxString('');
  Rx<String?> confiormPasswordErrorText  = RxString('');
  Rx<String?> nameErrorText  = RxString('');
  Rx<String?> nicknNameErrorText  = RxString('');
  GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  GlobalKey<FormState> newUserKey = GlobalKey<FormState>();
  GlobalKey<FormState> sellerProfileKey = GlobalKey<FormState>();
  // GlobalKey<FormState> profileKey = GlobalKey<FormState>();

  static GeneralGetxController get to =>
      Get.find<GeneralGetxController>();

  String? validator(String? value,type){
      switch (type) {
        case 'email':
          // print(emailValidation(value));
          emailErrorText.value =  emailValidation(value);
          break;
        case 'password':
          passwordErrorText.value =  passwordValidation(value);
          break;
        case 'conformPassword':
          confiormPasswordErrorText.value =  passwordValidation(value);
          break;
        case 'mobile':
          mobileErrorText.value= mobileValidation(value);
          break;
        case 'name':
          nameErrorText.value =  nameValidation(value);
          break;
        case 'nick_name':
          nicknNameErrorText.value =  nameValidation(value);
          break;
        case 'id':
          idErrorText.value =  idValidation(value);
      }
  }

  String? mobileValidation(String? value) {
    if(value == null || value.isEmpty){
      return 'lenght_condation'.tr;
    }else if(!GetUtils.isPhoneNumber(value)){
      return  'valid_phone'.tr;
    } else {
      return  '';
    }
  }


  String? emailValidation(String? value) {
    if(value == null || value.isEmpty){
      return 'lenght_condation'.tr;
    }else if(!GetUtils.isEmail(value)){
      return 'valid_email'.tr;
    } else {
     return '';
    }
  }

  String? passwordValidation(String? value) {
    if(value == null || value.isEmpty){
      return 'lenght_condation'.tr;
    }else if(value.length < 8) {
      return 'valid_password'.tr;
    }else {
      return '';
    }
  }
  String? idValidation(String? value) {
    if(value == null || value.isEmpty){
      return 'lenght_condation'.tr;
    }else if(value.length < 10) {
      return 'valid_password'.tr;
    }else {
      return '';
    }
  }

  String? nameValidation(String? value) {
    if(value == null || value.isEmpty){
      return 'lenght_condation'.tr;
    }else if(value.length < 4) {
      return 'valid_name'.tr;
    }else {
      return '';
    }
  }

sendFcmToken(token) async {

    Get.find<GeneralRepository>().sendFcmToken(token: token)
        .then((value) =>value.fold(
            (failure) {
              var responseMessage = mapFailureToMessage(failure);
              Get.snackbar(
                'Requires',
                responseMessage,
                backgroundColor: ColorResource.red,
                snackPosition: SnackPosition.BOTTOM,
              );
            },
            (response) {
              print("send successfully");
            })
    );
}

}