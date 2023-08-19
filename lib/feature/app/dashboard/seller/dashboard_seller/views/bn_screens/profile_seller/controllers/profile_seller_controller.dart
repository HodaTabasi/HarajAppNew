import 'package:get/get.dart';

class ProfileSellerController extends GetxController {
  static ProfileSellerController get to => Get.find<ProfileSellerController>();

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
