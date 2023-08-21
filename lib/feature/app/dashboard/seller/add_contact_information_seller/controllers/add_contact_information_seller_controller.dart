import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddContactInformationSellerController extends GetxController {
  static AddContactInformationSellerController get to =>
      Get.find<AddContactInformationSellerController>();

  RxBool loading = true.obs;
  RxBool isFavorite = false.obs;

  late TextEditingController whatsappController;
  late TextEditingController facebookController;

  @override
  void onInit() {
    super.onInit();
    whatsappController = TextEditingController();
    facebookController = TextEditingController();
  }

  @override
  void dispose() {
    whatsappController.dispose();
    facebookController.dispose();
    super.dispose();
  }

  void clear() {
    whatsappController.clear();
    facebookController.clear();
  }
}
