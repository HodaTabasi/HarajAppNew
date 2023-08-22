import 'package:get/get.dart';

class SearchBuyerController extends GetxController {
  static SearchBuyerController get to => Get.find<SearchBuyerController>();

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
