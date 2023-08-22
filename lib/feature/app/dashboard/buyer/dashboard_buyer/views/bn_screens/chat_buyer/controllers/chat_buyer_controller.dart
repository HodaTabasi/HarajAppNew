import 'package:get/get.dart';

class ChatBuyerController extends GetxController {
  static ChatBuyerController get to => Get.find<ChatBuyerController>();

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
