import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haraj/utils/extensions/color_resource/color_resource.dart';
import 'package:haraj/utils/models/seller_info/seller_user_model.dart';
import 'package:haraj/utils/prefs/shared_pref_controller.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../../utils/api_controller/complete_user_profile_controller.dart';
import '../../../../../../utils/errors/error_const.dart';
import '../../../../../../utils/repository/complete_user_repo.dart';
import '../../complete_store_seller/view/screen/complete_store_seller_screen.dart';
import '../use_case/complete_profile_use_case.dart';

class CompleteProfileSellerController extends GetxController {
  var responseMessage = "";

  static CompleteProfileSellerController get to =>
      Get.find<CompleteProfileSellerController>();

  RxBool loading = false.obs;
  RxBool isVisibility = false.obs;
  XFile? file;

  SellerUserModel get userModel => SellerUserModel(
        nickName: nickNameController.text,
        name: nameController.text,
        mobile: phoneController.text,
        ssn: idController.text,
      );

  void toggleVisibility() {
    isVisibility.value = !isVisibility.value;
    update();
  }

  late TextEditingController nameController;
  late TextEditingController phoneController;
  late TextEditingController idController;
  late TextEditingController nickNameController;

  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    phoneController = TextEditingController();
    idController = TextEditingController();
    nickNameController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    idController.dispose();
    nickNameController.dispose();
    super.dispose();
  }

  void clear() {
    nameController.clear();
    phoneController.clear();
    idController.clear();
    nickNameController.clear();
  }

  Future<void> performUpdateProfile() async {
    loading.value = true;
    if (checkData()) {
      await completeProfile();
    }
    loading.value = false;
  }

  bool checkData() {
    if (nameController.text.isNotEmpty &&
        phoneController.text.isNotEmpty &&
        idController.text.isNotEmpty &&
        nickNameController.text.isNotEmpty &&
        file != null) {
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
        .call(userModel, file!.path)
        .then((value) => value.fold((failure) {
              responseMessage = mapFailureToMessage(failure);
              Get.snackbar(
                'Requires',
                responseMessage,
                backgroundColor: ColorResource.red,
                snackPosition: SnackPosition.BOTTOM,
              );
            }, (user) async {
                SharedPrefController().isCompleteStore = false;
                Get.to(() => CompleteStoreSellerScreen());
               }));
  }
}
