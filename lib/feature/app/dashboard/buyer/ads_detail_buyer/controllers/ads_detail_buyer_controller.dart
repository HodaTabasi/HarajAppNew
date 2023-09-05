import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haraj/feature/app/dashboard/buyer/ads_detail_buyer/use_case/ads_show_use_case.dart';
import 'package:haraj/utils/errors/error_const.dart';
import 'package:haraj/utils/extensions/color_resource/color_resource.dart';
import 'package:haraj/utils/repository/ads_repo/ads_repo.dart';

class AdsDetailBuyerController extends GetxController {
  int id;
  AdsDetailBuyerController(this.id);
  static AdsDetailBuyerController get to =>
      Get.find<AdsDetailBuyerController>();

  RxBool loading = true.obs;
  RxBool isFavorite = false.obs;
  var responseMessage = "";

  late TextEditingController newPriceController;

  @override
  void onInit() {
    newPriceController = TextEditingController();
    getShowAds();
    super.onInit();
  }

  @override
  void dispose() {
    newPriceController.dispose();
    super.dispose();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> getShowAds() async {
    return AdsShowUseCase(repository: Get.find<AdsRepository>())
        .call(id)
        .then((value) => value.fold((failure) {
              responseMessage = mapFailureToMessage(failure);
              Get.snackbar(
                'Requires',
                responseMessage,
                backgroundColor: ColorResource.red,
                snackPosition: SnackPosition.BOTTOM,
              );
            }, (response) async {
              print("mmm Ads Detail Buyer Controller 💯=> $id ");
            }));
  }
}
