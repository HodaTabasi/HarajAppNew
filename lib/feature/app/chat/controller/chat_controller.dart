import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeChatController extends GetxController {
  static HomeChatController get to => Get.find<HomeChatController>();

  RxBool loading = true.obs;
  String seller = 'seller';

  late TextEditingController searchController;
  late TextEditingController messageController;

  @override
  void onInit() {
    searchController = TextEditingController();
    messageController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    searchController.dispose();
    messageController.dispose();
    super.dispose();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
