import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haraj/utils/extensions/color_resource/color_resource.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../../utils/errors/error_const.dart';
import '../../../../../../utils/models/seller_info/store_model.dart';
import '../../../../../../utils/prefs/shared_pref_controller.dart';
import '../../../../../../utils/repository/complete_user_repo.dart';
import '../../add_address_seller/view/screen/add_address_seller_screen.dart';
import '../use_case/complete_store_use_case.dart';

class CompleteStoreSellerController extends GetxController {
  var responseMessage = "";

  static CompleteStoreSellerController get to =>
      Get.find<CompleteStoreSellerController>();

  RxBool loading = false.obs;
  RxBool isVisibility = false.obs;
  XFile? file;

  Store get store => Store(
      name: nameController.text,
      email: emailController.text,
      mobile: phoneController.text,
      commercialRegister: commercialRegistrationNumController.text,
      description: briefController.text);

  void toggleVisibility() {
    isVisibility.value = !isVisibility.value;
    update();
  }

  late TextEditingController nameController;
  late TextEditingController phoneController;
  late TextEditingController commercialRegistrationNumController;
  late TextEditingController emailController;
  late TextEditingController briefController;

  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    phoneController = TextEditingController();
    commercialRegistrationNumController = TextEditingController();
    emailController = TextEditingController();
    briefController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    commercialRegistrationNumController.dispose();
    emailController.dispose();
    briefController.dispose();
    super.dispose();
  }

  void clear() {
    nameController.clear();
    phoneController.clear();
    commercialRegistrationNumController.clear();
    emailController.clear();
    briefController.clear();
  }

  Future<void> performAddStoreData() async {
    loading.value = true;
    if (checkData()) {
      await completeProfile();
    }
    loading.value = false;
  }

  bool checkData() {
    if (nameController.text.isNotEmpty &&
        phoneController.text.isNotEmpty &&
        commercialRegistrationNumController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        briefController.text.isNotEmpty) {
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

  Future<void> completeProfile() async {
    return CompleteStoreUseCase(
            repository: Get.find<CompletePersonalInfoRepo>())
        .call(store, file!.path)
        .then((value) => value.fold((failure) {
              responseMessage = mapFailureToMessage(failure);
              Get.snackbar(
                'Requires',
                responseMessage,
                backgroundColor: ColorResource.red,
                snackPosition: SnackPosition.BOTTOM,
              );
            }, (user) async {
              SharedPrefController().isCompleteAddress = false;
              Get.to(() => AddAddressSellerScreen());
            }));
  }
}
