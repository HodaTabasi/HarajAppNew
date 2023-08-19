import 'package:get/get.dart';

class HomeSellerController extends GetxController {
  static HomeSellerController get to => Get.find<HomeSellerController>();

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
