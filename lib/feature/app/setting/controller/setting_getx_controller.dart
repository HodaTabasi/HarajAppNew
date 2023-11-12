import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haraj/feature/app/auth/login/view/screen/login_screen.dart';
import 'package:haraj/feature/app/chat/controller/chat_controller.dart';
import 'package:haraj/feature/app/chat/controller/chat_details_controller.dart';
import 'package:haraj/feature/app/setting/use_case/delete_account_use_case.dart';
import 'package:haraj/feature/app/setting/use_case/logout_use_case.dart';
import 'package:haraj/feature/app/setting/use_case/update_email_use_case.dart';
import 'package:haraj/utils/prefs/shared_pref_controller.dart';
import 'package:haraj/utils/repository/general_repo.dart';

import '../../../../utils/errors/error_const.dart';
import '../../../../utils/extensions/color_resource/color_resource.dart';
import '../../../../utils/models/setting/setting.dart';
import '../../../../utils/repository/setting_repo.dart';
import '../use_case/get_setting_use_case.dart';
import '../use_case/update_password_use_case.dart';

class SettingGetXController extends GetxController {
  var responseMessage = "";
  SettingModel? settingModel;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController newPasswordController;
  late TextEditingController rePasswordController;
  RxBool loading = false.obs;

  RxBool isVisibility = false.obs;

  static SettingGetXController get to => Get.find<SettingGetXController>();

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    rePasswordController = TextEditingController();
    newPasswordController = TextEditingController();
    getSetting();
  }

  void toggleVisibility() {
    isVisibility.value = !isVisibility.value;
    update();
  }

  getSetting() {
    return GetSettingUseCase(repository: Get.find<GeneralRepository>())
        .call()
        .then((value) => value.fold((failure) {
              responseMessage = mapFailureToMessage(failure);
              Get.snackbar(
                'Requires',
                responseMessage,
                backgroundColor: ColorResource.red,
                snackPosition: SnackPosition.BOTTOM,
              );
            }, (response) async {
              settingModel = response;
            }));
  }

  updateEmail() {
    loading.value = true;
    return UpdateEmailUseCase(repository: Get.find<SettingRepo>())
        .call(emailController.text)
        .then((value) => value.fold((failure) {
              responseMessage = mapFailureToMessage(failure);
              Get.snackbar(
                'Requires',
                responseMessage,
                backgroundColor: ColorResource.red,
                snackPosition: SnackPosition.BOTTOM,
              );
              loading.value = false;
            }, (response) async {
              loading.value = false;
              SharedPrefController().email = response.data?.email;
            }));
  }

  updatePassword() {
    loading.value = true;
    return UpdatePasswordUseCase(repository: Get.find<SettingRepo>())
        .call(newPasswordController.text, passwordController.text,
            rePasswordController.text)
        .then((value) => value.fold((failure) {
              responseMessage = mapFailureToMessage(failure);
              Get.snackbar(
                'Requires',
                responseMessage,
                backgroundColor: ColorResource.red,
                snackPosition: SnackPosition.BOTTOM,
              );
              loading.value = false;
            }, (response) async {
              loading.value = false;
              Get.snackbar(
                'Good',
                'done successfully',
                backgroundColor: ColorResource.red,
                snackPosition: SnackPosition.BOTTOM,
              );
            }));
  }

  logout() {
    loading.value = true;
    return LogoutAccountUseCase(repository: Get.find<SettingRepo>())
        .call()
        .then((value) => value.fold((failure) {
              responseMessage = mapFailureToMessage(failure);
              Get.snackbar(
                'Session expired',
                'Please login again',
                backgroundColor: ColorResource.red,
                snackPosition: SnackPosition.BOTTOM,
              );
              FirebaseMessaging.instance.unsubscribeFromTopic('all_buyers');
              SharedPrefController()
                  .clear()
                  .then((value) => Get.offAll(() => LoginScreen()));
              Get.delete<ChatDetailsController>(force: true);
              Get.delete<HomeChatController>(force: true);
              loading.value = false;
            }, (response) async {
              FirebaseMessaging.instance.unsubscribeFromTopic('all_buyers');
              SharedPrefController()
                  .clear()
                  .then((value) => Get.offAll(() => LoginScreen()));
              Get.delete<ChatDetailsController>(force: true);
              Get.delete<HomeChatController>(force: true);
              loading.value = false;
            }));
  }

  deleteAccount() {
    loading.value = true;
    return DeleteAccountUseCase(repository: Get.find<SettingRepo>())
        .call()
        .then((value) => value.fold((failure) {
              responseMessage = mapFailureToMessage(failure);
              Get.snackbar(
                'Requires',
                responseMessage,
                backgroundColor: ColorResource.red,
                snackPosition: SnackPosition.BOTTOM,
              );
              loading.value = false;
            }, (response) async {
              loading.value = false;

              Get.offAll(() => LoginScreen());
            }));
  }
}
