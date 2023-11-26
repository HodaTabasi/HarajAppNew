import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haraj/feature/app/ads_detail/use_case/accept_offer_use_case.dart';
import 'package:haraj/feature/app/ads_detail/use_case/ads_show_use_case.dart';
import 'package:haraj/feature/app/ads_detail/use_case/instruction_use_case.dart';
import 'package:haraj/feature/app/ads_detail/use_case/post_favorite_ads_use_case.dart';
import 'package:haraj/feature/app/ads_detail/use_case/post_offer_use_case.dart';
import 'package:haraj/feature/app/ads_detail/use_case/reject_offer_use_case.dart';
import 'package:haraj/feature/app/ads_detail/use_case/show_post_new_offer_use_case.dart';
import 'package:haraj/feature/app/ads_detail/use_case/show_post_offer_use_case.dart';
import 'package:haraj/feature/app/ads_detail/views/screens/ads_detail_screen.dart';
import 'package:haraj/feature/app/dashboard/buyer/dashboard_buyer/views/bn_screens/home_buyer/controllers/home_buyer_controller.dart';
import 'package:haraj/feature/app/offer/controllers/offer_controller.dart';
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

import '../../dashboard/buyer/dashboard_buyer/views/bn_screens/favorite_buyer/controllers/favorite_buyer_controller.dart';
import '../../dashboard/buyer/dashboard_buyer/views/bn_screens/search_buyer/controllers/search_buyer_controller.dart';
import '../use_case/toggle_favorite_use_case.dart';

class AdsDetailController extends GetxController {
  final int productId; // Add this line to store the productId

  AdsDetailController({required this.productId}); // Add this constructor

  static AdsDetailController get to => Get.find<AdsDetailController>();

  RxBool loading = false.obs;
  RxBool isFavoriteLoading = false.obs;
  var responseMessage = "";
  Rx<Data> adsDetail = Data().obs;
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
              adsDetail.value = response;
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
              allOffers.clear();
              allOffers.addAll(response.data ?? []);
              meta = response.meta ?? Meta(currentPage: 1,lastPage: 1);
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

  Future<void> acceptOffer({postId}) async {
    return AcceptOfferUseCase(repository: Get.find<OfferRepository>())
        .call(postId.toString())
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
                if (response.success) {
                  int index =
                      newOffers.indexWhere((element) => element.id == postId);
                  if (index != -1) {
                    newOffers.removeAt(index);
                    showPostOffer();
                    OfferController.to.showPostNewOffer();
                    OfferController.to.showPostAcceptedOffers();
                    OfferController.to.showPostRejectedOffers();
                    update();
                  }
                } else {
                  Get.snackbar(
                    'Requires',
                    responseMessage,
                    backgroundColor: ColorResource.red,
                    snackPosition: SnackPosition.BOTTOM,
                  );
                }
              },
            ));
  }

  Future<void> rejectOffer({postId}) async {
    return RejectOfferUseCase(repository: Get.find<OfferRepository>())
        .call(postId.toString())
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
                if (response.success) {
                  int index =
                      newOffers.indexWhere((element) => element.id == postId);
                  if (index != -1) {
                    newOffers.removeAt(index);
                    showPostOffer();
                    OfferController.to.showPostNewOffer();
                    OfferController.to.showPostAcceptedOffers();
                    OfferController.to.showPostRejectedOffers();
                    update();
                  }
                } else {
                  Get.snackbar(
                    'Requires',
                    responseMessage,
                    backgroundColor: ColorResource.red,
                    snackPosition: SnackPosition.BOTTOM,
                  );
                }
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

  Future<void> toggleFavorite({postId}) async {
    isFavoriteLoading.value = true;
    return ToggleFavoriteUseCase(repository: Get.find<AdsRepository>())
        .call(postId.toString())
        .then((value) => value.fold(
          (failure) {
        responseMessage = mapFailureToMessage(failure);
        Get.snackbar(
          'Requires',
          responseMessage,
          backgroundColor: ColorResource.red,
          snackPosition: SnackPosition.BOTTOM,
        );
        isFavoriteLoading.value = false;
      },
          (response) async {
            adsDetail.value.isFavorite = !(adsDetail.value.isFavorite!);
            int index = HomeBuyerController.to.ads.indexWhere((element) => element.id == adsDetail.value.id);
            HomeBuyerController.to.ads[index].isFavorite = adsDetail.value.isFavorite;
            HomeBuyerController.to.ads.refresh();
            if(SearchBuyerController.isPut) {
              final index = SearchBuyerController.to.ads.indexWhere((element) => element.id == postId);
              if(index != -1) {
                SearchBuyerController.to.ads[index].isFavorite = !(SearchBuyerController.to.ads[index].isFavorite!);
                SearchBuyerController.to.ads.refresh();
              }
            }
            if(FavoriteBuyerController.isPut) {
              final index = FavoriteBuyerController.to.savedAds.indexWhere((element) => element.id == postId);
              if(index != -1) {
                FavoriteBuyerController.to.savedAds.removeAt(index);
                FavoriteBuyerController.to.savedAds.refresh();
              }
            }
            isFavoriteLoading.value = false;
      },
    ));
  }
}
