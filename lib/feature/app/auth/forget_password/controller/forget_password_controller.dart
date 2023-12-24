import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:haraj/feature/app/auth/forget_password/use_case/verify_use_case.dart';
import 'package:haraj/feature/app/auth/login/view/screen/login_screen.dart';

import '../../../../../utils/errors/error_const.dart';
import '../../../../../utils/extensions/color_resource/color_resource.dart';
import '../../../../../utils/prefs/shared_pref_controller.dart';
import '../../../../../utils/repository/auth_repo.dart';
import '../use_case/forget_password_use_case.dart';
import '../use_case/send_code_use_case.dart';
import '../view/screen/forget_password_screen.dart';

class ForgetPasswordController extends GetxController {
  String responseMessage = "";

  String emailText ="";
  RxBool isVisibility = false.obs;


  static ForgetPasswordController get to => Get.find<ForgetPasswordController>();

  RxBool loading = false.obs;
  RxBool reSendLoading = false.obs;
  late TextEditingController emailController;

  late TextEditingController num1Controller = TextEditingController();
  late TextEditingController num2Controller = TextEditingController();
  late TextEditingController num3Controller = TextEditingController();
  late TextEditingController num6Controller = TextEditingController();
  late TextEditingController passwordController = TextEditingController();
  late TextEditingController confirmPasswordController = TextEditingController();


  toggleVisibility() {
    isVisibility.value = !isVisibility.value;
    update();
  }


  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    num1Controller.dispose();
    num2Controller.dispose();
    num3Controller.dispose();
    num6Controller.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();


    super.dispose();
  }

  void clear() {
    emailController.clear();
    num1Controller.clear();
    num2Controller.clear();
    num3Controller.clear();
    num6Controller.clear();
    passwordController.clear();
    confirmPasswordController.clear();
  }

    Future<void> performReSend() async {
    reSendLoading.value = true;
    if (checkEmail()) {
      await sendCode();
    }
    reSendLoading.value = false;
  }
  Future<void> sendCode() async {
    return SendCodeUseCase(repository: Get.find<AuthRepository>())
        .call(emailController.text)
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
      Get.to(()=>OTPScreen());
    }));
  }

  Future<void> doVerify() async {
    return VerifyUseCase(repository: Get.find<AuthRepository>())
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
      Get.offAll(AddPasswordScreen());
      await SharedPrefController().save(user: user);
      /*if (user.data?.type == 1) {
        Get.offAll(CompleteProfileSellerScreen());
      } else {
        Get.offAll(CompleteProfileBuyerScreen());
      }*/
    }));
  }

  Future<void> doChangePassword() async {
    return ForgetPasswordUseCase(repository: Get.find<AuthRepository>())
        .call(passwordController.text, confirmPasswordController.text)
        .then((value) => value.fold((failure) {
      responseMessage = mapFailureToMessage(failure);
      Get.snackbar(
        'Requires',
        responseMessage,
        backgroundColor: ColorResource.red,
        snackPosition: SnackPosition.BOTTOM,
      );
    }, (user) async {
      SharedPrefController().clear();
      Get.offAll(LoginScreen());
      //await SharedPrefController().save(user: user);
      /*if (user.data?.type == 1) {
        Get.offAll(CompleteProfileSellerScreen());
      } else {
        Get.offAll(CompleteProfileBuyerScreen());
      }*/
    }));
  }


  bool checkEmail() {
    if (emailController.text.isNotEmpty) {
      return true;
    }
    Get.snackbar(
      'Requires',
      'Please Enter Email',
      backgroundColor: ColorResource.red,
      snackPosition: SnackPosition.BOTTOM,
    );
    return false;
  }

  bool checkCode() {
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

  bool checkPassword() {
    if (passwordController.text.isNotEmpty &&
        confirmPasswordController.text.isNotEmpty) {
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


  makeCode(){
    return '${num1Controller.text}${num2Controller.text}${num3Controller.text}${num6Controller.text}';
  }


  Future<void> performVerify() async {
    loading.value = true;
    if (checkCode()) {
      await doVerify();
    }
    loading.value = false;
  }


  Future<void> performChangePassword() async {
    loading.value = true;
    if (checkPassword()) {
      await doChangePassword();
    }
    loading.value = false;
  }



}