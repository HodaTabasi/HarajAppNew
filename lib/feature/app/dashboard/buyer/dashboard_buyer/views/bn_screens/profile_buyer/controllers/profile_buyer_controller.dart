import 'package:get/get.dart';

class ProfileBuyerController extends GetxController {
  static ProfileBuyerController get to => Get.find<ProfileBuyerController>();

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
