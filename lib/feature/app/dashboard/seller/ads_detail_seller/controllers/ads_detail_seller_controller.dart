import 'package:get/get.dart';

class AdsDetailSellerController extends GetxController {
  static AdsDetailSellerController get to =>
      Get.find<AdsDetailSellerController>();

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
