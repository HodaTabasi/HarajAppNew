import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haraj/feature/app/dashboard/buyer/dashboard_buyer/views/bn_screens/profile_buyer/controllers/profile_buyer_controller.dart';
import 'package:haraj/feature/app/dashboard/buyer/dashboard_buyer/views/dashboard_screen.dart';
import 'package:haraj/utils/extensions/color_resource/color_resource.dart';
import 'package:haraj/utils/models/seller_info/seller_user_model.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../utils/errors/error_const.dart';
import '../../../../../utils/repository/complete_user_repo.dart';
import '../use_case/complete_profile_use_case.dart';

class CompleteProfileBuyerController extends GetxController {
  var responseMessage = "";

  bool fromEditPage = false;

  XFile? file;
  String? imageUrl;

  static CompleteProfileBuyerController get to =>
      Get.find<CompleteProfileBuyerController>();

  RxBool loading = false.obs;
  RxBool isVisibility = false.obs;

  SellerUserModel get userModel => SellerUserModel(
        name: nameController.text,
        mobile: phoneController.text,
      );

  void toggleVisibility() {
    isVisibility.value = !isVisibility.value;
    update();
  }

  late TextEditingController nameController;
  late TextEditingController phoneController;

  @override
  void onInit() {
    super.onInit();
    putDataToTextField();
  }

  putDataToTextField({SellerUserModel? user}) {
    nameController = TextEditingController();
    phoneController = TextEditingController();
    if (user != null) {
      nameController.text = user.name ?? '';
      phoneController.text = user.mobile ?? '';
      imageUrl = user.avatar;
      fromEditPage = true;
    } else {
      fromEditPage = false;
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();

    super.dispose();
  }

  void clear() {
    nameController.clear();
    phoneController.clear();
  }

  Future<void> performRegister() async {
    loading.value = true;
    if (checkData()) {
      await completeProfile();
    }
    loading.value = false;
  }

  bool checkData() {
    if (nameController.text.isNotEmpty && phoneController.text.isNotEmpty) {
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

  completeProfile() async {
    return CompleteProfileUseCase(
            repository: Get.find<CompletePersonalInfoRepo>())
        .call(userModel, file?.path)
        .then((value) => value.fold((failure) {
              responseMessage = mapFailureToMessage(failure);
              Get.snackbar(
                'Requires',
                responseMessage,
                backgroundColor: ColorResource.red,
                snackPosition: SnackPosition.BOTTOM,
              );
            }, (user) async {
              if (fromEditPage) {
                ProfileBuyerController.to.userModel = user;
                Get.back();
              } else {
                Get.to(() => const DashboardBuyerScreen());
              }
            }));
  }
}
