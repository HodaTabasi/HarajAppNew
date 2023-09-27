import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haraj/feature/app/ads_detail/use_case/accept_offer_use_case.dart';
import 'package:haraj/feature/app/ads_detail/use_case/ads_show_use_case.dart';
import 'package:haraj/feature/app/ads_detail/use_case/instruction_use_case.dart';
import 'package:haraj/feature/app/ads_detail/use_case/post_favorite_ads_use_case.dart';
import 'package:haraj/feature/app/ads_detail/use_case/post_offer_use_case.dart';
import 'package:haraj/feature/app/ads_detail/use_case/show_post_new_offer_use_case.dart';
import 'package:haraj/feature/app/ads_detail/use_case/show_post_offer_use_case.dart';
import 'package:haraj/feature/app/ads_detail/views/screens/ads_detail_screen.dart';
import 'package:haraj/utils/errors/error_const.dart';
import 'package:haraj/utils/extensions/color_resource/color_resource.dart';
import 'package:haraj/utils/models/ads_model/ads_model.dart';
import 'package:haraj/utils/models/general/general_model.dart';
import 'package:haraj/utils/models/meta/meta_model.dart';
import 'package:haraj/utils/models/offer/offer_model.dart';
import 'package:haraj/utils/models/offer/post_model.dart';
import 'package:haraj/utils/prefs/shared_pref_controller.dart';
import 'package:haraj/utils/repository/ads_repo/ads_repo.dart';
import 'package:haraj/utils/repository/favorite_repo/favorite_repo.dart';
import 'package:haraj/utils/repository/offer_repo/offer_repo.dart';
import 'package:url_launcher/url_launcher.dart';

class AdsDetailController extends GetxController {
  final int productId; // Add this line to store the productId

  AdsDetailController({required this.productId}); // Add this constructor

  static AdsDetailController get to => Get.find<AdsDetailController>();

  RxBool loading = false.obs;
  RxBool isFavorite = false.obs;
  var responseMessage = "";
  Data adsDetail = Data();
  OfferModel offerModel = OfferModel();
  RxList<OfferModel> newOffers = <OfferModel>[].obs;
  RxList<OfferModel> allOffers = <OfferModel>[].obs;
  RxList<GeneralModel> instructionModel = <GeneralModel>[].obs;
  PostModel favorite = PostModel();
  Meta meta = Meta();
  late ScrollController scrollController;

  late TextEditingController newPriceController;
  int selectedMenuItem = 1; // Initialize with the default value (all_offers)

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
    scrollController = ScrollController();
    scrollController.addListener(_listener);
    newPriceController = TextEditingController();
    getShowAds();
  }

  void _listener() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      if (meta.currentPage! < meta.lastPage!) {
        showPostOffer(pageNumber: meta.currentPage);
        showPostNewOffer(pageNumber: meta.currentPage);
      }
    }
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
              if (SharedPrefController().type == 1) {
                showPostOffer();
                showPostNewOffer();
              }
              loading.value = false;
            }));
  }

  Future<void> postOfferAds() async {
    return PostOfferUseCase(repository: Get.find<OfferRepository>())
        .call(productId.toString(), newPriceController.text)
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
    return InstructionUseCase(repository: Get.find<AdsRepository>())
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
              instructionModel.addAll(response.data ?? []);
            }));
  }

  Future<void> showPostOffer({pageNumber = 1}) async {
    return ShowPostOfferUseCase(repository: Get.find<OfferRepository>())
        .call(productId.toString(), pageNumber)
        .then((value) => value.fold((failure) {
              responseMessage = mapFailureToMessage(failure);
              Get.snackbar(
                'Requires',
                responseMessage,
                backgroundColor: ColorResource.red,
                snackPosition: SnackPosition.BOTTOM,
              );
            }, (response) async {
              allOffers.addAll(response.data ?? []);
              meta = response.meta!;
            }));
  }

  Future<void> showPostNewOffer({pageNumber = 1}) async {
    return ShowPostNewOfferUseCase(repository: Get.find<OfferRepository>())
        .call(pageNumber)
        .then((value) => value.fold((failure) {
              responseMessage = mapFailureToMessage(failure);
              Get.snackbar(
                'Requires',
                responseMessage,
                backgroundColor: ColorResource.red,
                snackPosition: SnackPosition.BOTTOM,
              );
            }, (response) async {
              newOffers.addAll(response.data ?? []);
              meta = response.meta!;
            }));
  }

  Future<void> acceptOffer() async {
    return AcceptOfferUseCase(repository: Get.find<OfferRepository>())
        .call(productId.toString())
        .then((value) => value.fold(
              (failure) {
                responseMessage = mapFailureToMessage(failure);
                Get.snackbar(
                  'Requires',
                  responseMessage,
                  backgroundColor: ColorResource.red,
                  snackPosition: SnackPosition.BOTTOM,
                );
              },
              (response) async {
                // offerModel = response;
                debugPrint("mmm stare acceptOffer 💯=> $response");
                int index = newOffers
                    .indexWhere((element) => element.postId! == productId);
                debugPrint("mmm index acceptOffer 💯=> $response");
                debugPrint("mmm index acceptOffer 💯=> $index");
                if (index != -1) {
                  debugPrint("mmm before remove acceptOffer 💯=> $index");
                  newOffers.removeAt(index);
                  debugPrint("mmm after after acceptOffer1 💯=> $index");
                  update();
                  debugPrint("mmm after after acceptOffer2 💯=> $index");
                }
                debugPrint("mmm out of index acceptOffer 💯=> $response");
                debugPrint("mmm out of index acceptOffer 💯=> $index");
              },
            ));
  }

  Future<void> postFavoriteAds({adsId}) async {
    return PostFavoriteAdsShowUseCase(
            repository: Get.find<FavoriteRepository>())
        .call(adsId)
        .then((value) => value.fold((failure) {
              responseMessage = mapFailureToMessage(failure);
              Get.snackbar(
                'Requires',
                responseMessage,
                backgroundColor: ColorResource.red,
                snackPosition: SnackPosition.BOTTOM,
              );
            }, (response) async {
              favorite = response;
              update();
            }));
  }
}
