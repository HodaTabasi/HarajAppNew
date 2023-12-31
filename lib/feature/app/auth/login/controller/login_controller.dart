import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haraj/feature/app/dashboard/seller/dashboard_seller/views/dashboard_screen.dart';
import 'package:haraj/feature/app/profile/seller/add_address_seller/view/screen/add_address_seller_screen.dart';
import 'package:haraj/feature/app/profile/seller/complete_store_seller/view/screen/complete_store_seller_screen.dart';
import 'package:haraj/utils/extensions/color_resource/color_resource.dart';
import 'package:haraj/utils/prefs/shared_pref_controller.dart';
import 'package:haraj/utils/repository/auth_repo.dart';

import '../../../../../utils/errors/error_const.dart';
import '../../../dashboard/buyer/dashboard_buyer/views/dashboard_screen.dart';
import '../../../profile/complete_profile/profile_seller/screen/complete_profile_seller_screen.dart';
import '../use_case/login_use_case.dart';

class LoginController extends GetxController {
  String responseMessage = "";

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

  Future<void> performLogin() async {
    loading.value = true;
    if (checkData()) {
      await login();
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

  Future<void> login() async {
    // EasyLoading.show(indicator: EasyLoading().indicatorWidget);
    return LoginUseCase(repository: Get.find<AuthRepository>())
        .call(emailController.text, passwordController.text)
        .then((value) => value.fold((failure) {
              // EasyLoading.dismiss();
              responseMessage = mapFailureToMessage(failure);
              Get.snackbar(
                'Requires',
                responseMessage,
                backgroundColor: ColorResource.red,
                snackPosition: SnackPosition.BOTTOM,
              );
            }, (user) async {
              await SharedPrefController().save(user: user);
              if (user.data?.type == 1) {
                if (user.data?.name == null) {
                  Get.offAll(() => CompleteProfileSellerScreen());
                } else if (user.data?.store?.name == null) {
                  Get.offAll(() => CompleteStoreSellerScreen());
                } else if (user.data?.store?.address?.city == null) {
                  Get.offAll(() => AddAddressSellerScreen());
                } else {
                  Get.offAll(() => const DashboardSellerScreen());
                }
              } else {
                Get.offAll(() => const DashboardBuyerScreen());
              }
              // EasyLoading.dismiss();
            }));
  }
}
