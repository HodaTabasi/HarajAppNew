import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haraj/utils/extensions/color_resource/color_resource.dart';

class CompleteProfileBuyerController extends GetxController {
  static CompleteProfileBuyerController get to =>
      Get.find<CompleteProfileBuyerController>();

  RxBool loading = false.obs;
  RxBool isVisibility = false.obs;

  void toggleVisibility() {
    isVisibility.value = !isVisibility.value;
    update();
  }

  late TextEditingController nameController;
  late TextEditingController phoneController;

  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    phoneController = TextEditingController();
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
      // await completeProfile();
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

// Future<void> completeProfile() async {
//   bool status = await AuthApiController().completeProfile();
//   if (status) {
//     Get.to(const HomeScreen());
//     clear();
//   }
// }
}
