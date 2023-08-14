import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haraj/utils/extensions/color_resource/color_resource.dart';

class CompleteStoreSellerController extends GetxController {
  static CompleteStoreSellerController get to =>
      Get.find<CompleteStoreSellerController>();

  RxBool loading = false.obs;
  RxBool isVisibility = false.obs;

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

  Future<void> performRegister() async {
    loading.value = true;
    if (checkData()) {
      // await completeProfile();
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

// Future<void> completeProfile() async {
//   bool status = await AuthApiController().completeProfile();
//   if (status) {
//     Get.to(const HomeScreen());
//     clear();
//   }
// }
}
