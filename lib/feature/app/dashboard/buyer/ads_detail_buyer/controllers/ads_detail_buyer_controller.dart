import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haraj/feature/app/dashboard/buyer/ads_detail_buyer/use_case/ads_show_use_case.dart';
import 'package:haraj/feature/app/dashboard/buyer/ads_detail_buyer/views/screens/ads_detail_buyer_screen.dart';
import 'package:haraj/utils/errors/error_const.dart';
import 'package:haraj/utils/extensions/color_resource/color_resource.dart';
import 'package:haraj/utils/models/ads_model/ads_model.dart';
import 'package:haraj/utils/models/general/general_model.dart';
import 'package:haraj/utils/models/offer/offer_model.dart';
import 'package:haraj/utils/repository/ads_repo/ads_repo.dart';
import 'package:url_launcher/url_launcher.dart';

class AdsDetailBuyerController extends GetxController {
  final int productId; // Add this line to store the productId

  AdsDetailBuyerController({required this.productId}); // Add this constructor

  static AdsDetailBuyerController get to =>
      Get.find<AdsDetailBuyerController>();

  RxBool loading = false.obs;
  RxBool isFavorite = false.obs;
  var responseMessage = "";
  Data adsDetail = Data();
  OfferModel offerModel = OfferModel();
  RxList<GeneralModel> instructionModel = <GeneralModel>[].obs;

  late TextEditingController newPriceController;

  Future<void> launchURL(String url, String scheme) async {
    final Uri launchUri = Uri(
      scheme: scheme,
      path: url,
    );
    await launchUrl(launchUri);
  }

  @override
  void onInit() {
    super.onInit();
    newPriceController = TextEditingController();
    getShowAds();
  }

  void clear() {
    newPriceController.clear();
  }

  Future<void> performNewPrice() async {
    if (checkData()) {
      await postOfferAds();
    }
  }

  bool checkData() {
    if (newPriceController.text.isNotEmpty) {
      return true;
    }
    Get.snackbar(
      'Requires',
      'Enter Required',
      backgroundColor: ColorResource.red,
      snackPosition: SnackPosition.BOTTOM,
    );
    return false;
  }

  Future<void> getShowAds() async {
    loading.value = true;
    return AdsShowUseCase(repository: Get.find<AdsRepository>())
        .call(productId)
        .then((value) => value.fold((failure) {
              responseMessage = mapFailureToMessage(failure);
              loading.value = false;
              Get.snackbar(
                'Requires',
                responseMessage,
                backgroundColor: ColorResource.red,
                snackPosition: SnackPosition.BOTTOM,
              );
            }, (response) async {
              adsDetail = response;
              getInstructionAds();
              loading.value = false;
            }));
  }

  Future<void> postOfferAds() async {
    return AdsShowUseCase(repository: Get.find<AdsRepository>())
        .postOffer(productId.toString(), newPriceController.text)
        .then((value) => value.fold((failure) {
              responseMessage = mapFailureToMessage(failure);
              Get.snackbar(
                'Requires',
                responseMessage,
                backgroundColor: ColorResource.red,
                snackPosition: SnackPosition.BOTTOM,
              );
            }, (response) async {
              offerModel = response;
              clear();
              Get.dialog(CheckAlertDialog());
            }));
  }

  Future<void> getInstructionAds() async {
    return AdsShowUseCase(repository: Get.find<AdsRepository>())
        .callInstruction()
        .then((value) => value.fold((failure) {
              responseMessage = mapFailureToMessage(failure);
              Get.snackbar(
                'Requires',
                responseMessage,
                backgroundColor: ColorResource.red,
                snackPosition: SnackPosition.BOTTOM,
              );
            }, (response) async {
              instructionModel.addAll(response.data ?? []);
            }));
  }
}
