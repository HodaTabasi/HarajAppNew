import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class GeneralGetxController extends GetxController {
  RxString mobile = RxString('');
  Rx<String?> mobileErrorText  = RxString('');
  Rx<String?> emailErrorText  = RxString('');
  Rx<String?> passwordErrorText  = RxString('');
  Rx<String?> nameErrorText  = RxString('');
  GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  // GlobalKey<FormState> newUserKey = GlobalKey<FormState>();
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
        case 'mobile':
          mobileErrorText.value= mobileValidation(value);
          break;
        case 'name':
          nameErrorText.value =  nameValidation(value);
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

  String? nameValidation(String? value) {
    if(value == null || value.isEmpty){
      return 'lenght_condation'.tr;
    }else if(value.length < 4) {
      return 'valid_name'.tr;
    }else {
      return '';
    }
  }



}