import 'package:get/get.dart';
import 'package:haraj/feature/app/dashboard/buyer/dashboard_buyer/views/bn_screens/home_buyer/use_case/ads_use_case.dart';
import 'package:haraj/utils/errors/error_const.dart';
import 'package:haraj/utils/extensions/color_resource/color_resource.dart';
import 'package:haraj/utils/repository/ads_repo/ads_repo.dart';

class HomeBuyerController extends GetxController {
  static HomeBuyerController get to => Get.find<HomeBuyerController>();

  RxBool loading = true.obs;
  RxBool isFavorite = false.obs;
  var responseMessage = "";

  @override
  void onInit() {
    super.onInit();
    getIndexAds();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> getIndexAds() async {
    return AdsUseCase(repository: Get.find<AdsRepository>())
        .call()
        .then((value) => value.fold((failure) {
              responseMessage = mapFailureToMessage(failure);
              Get.snackbar(
                'Requires',
                responseMessage,
                backgroundColor: ColorResource.red,
                snackPosition: SnackPosition.BOTTOM,
              );
            }, (response) async {
              print("mmm home buyer controller 💯=> i am here ");
            }));
  }
}
