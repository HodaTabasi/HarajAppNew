import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/errors/error_const.dart';
import '../../../../../utils/extensions/color_resource/color_resource.dart';
import '../../../../../utils/prefs/shared_pref_controller.dart';
import '../../../../../utils/repository/auth_repo.dart';
import '../../../profile/complete_profile/profile_buyer/screen/complete_profile_buyer_screen.dart';
import '../../../profile/complete_profile/profile_seller/screen/complete_profile_seller_screen.dart';
import '../use_case/regester_use_case.dart';
import '../use_case/resend_use_case.dart';

class OTPGetxController extends GetxController {
  String responseMessage = "";

  String emailText ="";

  static OTPGetxController get to => Get.find<OTPGetxController>();

  RxBool loading = false.obs;
  RxBool reSendLoading = false.obs;

  TextEditingController num1Controller = TextEditingController();
  TextEditingController num2Controller = TextEditingController();
  TextEditingController num3Controller = TextEditingController();
  TextEditingController num6Controller = TextEditingController();

  @override
  void dispose() {
    num1Controller.dispose();
    num2Controller.dispose();
    num3Controller.dispose();
    num6Controller.dispose();
    super.dispose();
  }

  void clear() {
    num1Controller.clear();
    num2Controller.clear();
    num3Controller.clear();
    num6Controller.clear();
  }

  makeCode(){
    return '${num1Controller.text}${num2Controller.text}${num3Controller.text}${num6Controller.text}';
  }

  Future<void> performVerify() async {
    loading.value = true;
    if (checkData()) {
      await doVerify();
    }
    loading.value = false;
  }

  bool checkData() {
    if (num1Controller.text.isNotEmpty &&
        num2Controller.text.isNotEmpty &&
        num3Controller.text.isNotEmpty &&
        num6Controller.text.isNotEmpty) {
      return true;
    }
    Get.snackbar(
      'Requires',
      'Enter Required',
      backgroundColor: ColorResource.red,
      snackPosition: SnackPosition.BOTTOM,
    );
    return false;
  }

  Future<void> doVerify() async {
    return RegisterUseCase(repository: Get.find<AuthRepository>())
        .call(makeCode())
        .then((value) => value.fold((failure) {
      responseMessage = mapFailureToMessage(failure);
      Get.snackbar(
        'Requires',
        responseMessage,
        backgroundColor: ColorResource.red,
        snackPosition: SnackPosition.BOTTOM,
      );
    }, (user) async {
      SharedPrefController().save(user: user);
      SharedPrefController().isCompleteProfile = false;
      if (user.data?.type == 1) {
        Get.offAll(CompleteProfileSellerScreen());
      } else {
        Get.offAll(CompleteProfileBuyerScreen());
      }
    }));
  }

  Future<void> performReSend() async {
    reSendLoading.value = true;

      await reSendCode();

    reSendLoading.value = false;
  }
  Future<void> reSendCode() async {
    return ResendVerifyUseCase(repository: Get.find<AuthRepository>())
        .call(emailText)
        .then((value) => value.fold((failure) {
      responseMessage = mapFailureToMessage(failure);
      Get.snackbar(
        'Requires',
        responseMessage,
        backgroundColor: ColorResource.red,
        snackPosition: SnackPosition.BOTTOM,
      );
    }, (response) async {
      SharedPrefController().vierifyCode = response.data?.id;
    }));
  }

}