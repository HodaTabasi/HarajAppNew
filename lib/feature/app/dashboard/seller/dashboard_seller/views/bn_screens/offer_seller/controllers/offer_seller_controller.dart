import 'package:get/get.dart';

class OfferSellerController extends GetxController {
  static OfferSellerController get to => Get.find<OfferSellerController>();

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
