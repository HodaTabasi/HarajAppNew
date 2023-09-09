import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haraj/utils/extensions/color_resource/color_resource.dart';
import 'package:haraj/utils/prefs/shared_pref_controller.dart';
import 'package:haraj/utils/repository/auth_repo.dart';

import '../../../../../utils/errors/error_const.dart';
import '../../../../../utils/extensions/routes/key_routes.dart';
import '../../../dashboard/buyer/dashboard_buyer/views/dashboard_screen.dart';
import '../../../dashboard/seller/dashboard_seller/views/dashboard_screen.dart';
import '../../../profile/seller/complete_profile_seller/view/screen/complete_profile_seller_screen.dart';
import '../../register/view/screen/register_screen.dart';
import '../use_case/login_use_case.dart';
import '../../register/use_case/verify_use_case.dart';

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
              SharedPrefController().save(user: user);
              if (user.data?.type == 1) {
                if(user.data?.store!= null){
                  Get.offAll(() => DashboardSellerScreen());
                }else {
                  Get.offAll(() => CompleteProfileSellerScreen());
                }

              } else {
                Get.offAll(() => DashboardBuyerScreen());
              }
              // EasyLoading.dismiss();
            }));
  }


}
