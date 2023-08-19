import 'package:get/get.dart';

class ChatSellerController extends GetxController {
  static ChatSellerController get to => Get.find<ChatSellerController>();

  RxBool loading = true.obs;
  RxBool isFavorite = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
