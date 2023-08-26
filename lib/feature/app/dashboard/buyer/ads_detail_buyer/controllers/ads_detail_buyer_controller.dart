import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdsDetailBuyerController extends GetxController {
  static AdsDetailBuyerController get to =>
      Get.find<AdsDetailBuyerController>();

  RxBool loading = true.obs;
  RxBool isFavorite = false.obs;

  late TextEditingController newPriceController;

  @override
  void onInit() {
    newPriceController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    newPriceController.dispose();
    super.dispose();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
