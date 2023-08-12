import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haraj/utils/extensions/color_resource/color_resource.dart';

class LoginController extends GetxController {
  static LoginController get to => Get.find<LoginController>();

  RxBool loading = false.obs;
  RxBool isVisibility = false.obs;

  void toggleVisibility() {
    isVisibility.value = !isVisibility.value;
    update();
  }

  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void clear() {
    emailController.clear();
    passwordController.clear();
  }

  Future<void> performRegister() async {
    loading.value = true;
    if (checkData()) {
      // await login();
    }
    loading.value = false;
  }

  bool checkData() {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
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

  // Future<void> login() async {
  //   bool status = await AuthApiController().login();
  //   if (status) {
  //     Get.to(const OTPScreen());
  //     clear();
  //   }
  // }
}
