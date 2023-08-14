import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haraj/utils/extensions/color_resource/color_resource.dart';

class CompleteProfileSellerController extends GetxController {
  static CompleteProfileSellerController get to =>
      Get.find<CompleteProfileSellerController>();

  RxBool loading = false.obs;
  RxBool isVisibility = false.obs;

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
        idController.text.isNotEmpty &&
        nickNameController.text.isNotEmpty) {
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
