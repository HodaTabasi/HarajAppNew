import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haraj/feature/app/auth/otp/controller/otp_controller.dart';
import 'package:haraj/utils/extensions/color_resource/color_resource.dart';

import '../../../../../utils/errors/error_const.dart';
import '../../../../../utils/prefs/shared_pref_controller.dart';
import '../../../../../utils/repository/auth_repo.dart';
import '../../otp/view/screen/otp_screen.dart';
import '../use_case/verify_use_case.dart';

class RegisterController extends GetxController {
  String responseMessage = "";

  static RegisterController get to => Get.find<RegisterController>();

  RxBool loading = false.obs;
  RxBool isVisibility = false.obs;
  String type = "1";

  void toggleVisibility() {
    isVisibility.value = !isVisibility.value;
    update();
  }

  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void clear() {
    emailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
  }

  Future<void> performRegister() async {
    loading.value = true;
    if (checkData()) {
      await register();
    }
    loading.value = false;
  }

  bool checkData() {
    if (emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
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

  Future<void> register() async {
    return VerifyUseCase(repository: Get.find<AuthRepository>())
        .call(emailController.text, passwordController.text, type)
        .then((value) => value.fold((failure) {
              responseMessage = mapFailureToMessage(failure);
              Get.snackbar(
                'Requires',
                responseMessage,
                backgroundColor: ColorResource.red,
                snackPosition: SnackPosition.BOTTOM,
              );
            }, (response) async {
              OTPGetxController.to.emailText = emailController.text;
              SharedPrefController().vierifyCode = response.data?.id;
              Get.off(() => OTPScreen());
            }));
  }
}
