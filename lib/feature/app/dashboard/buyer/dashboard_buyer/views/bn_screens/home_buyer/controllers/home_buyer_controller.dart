import 'package:get/get.dart';

class HomeBuyerController extends GetxController {
  static HomeBuyerController get to => Get.find<HomeBuyerController>();

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
