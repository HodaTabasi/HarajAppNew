import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OfferBuyerController extends GetxController {
  static OfferBuyerController get to => Get.find<OfferBuyerController>();

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
}
