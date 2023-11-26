import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haraj/feature/app/dashboard/buyer/dashboard_buyer/views/bn_screens/favorite_buyer/controllers/favorite_buyer_controller.dart';
import 'package:haraj/feature/app/dashboard/buyer/dashboard_buyer/views/bn_screens/home_buyer/use_case/ads_buyer_use_case.dart';
import 'package:haraj/feature/app/dashboard/buyer/dashboard_buyer/views/bn_screens/search_buyer/controllers/search_buyer_controller.dart';
import 'package:haraj/utils/errors/error_const.dart';
import 'package:haraj/utils/extensions/color_resource/color_resource.dart';
import 'package:haraj/utils/models/meta/meta_model.dart';
import 'package:haraj/utils/repository/ads_repo/ads_repo.dart';

import '../../../../../../../../../utils/models/ads_model/ads_model.dart';
import '../../../../../../../ads_detail/use_case/toggle_favorite_use_case.dart';

class HomeBuyerController extends GetxController {
  static HomeBuyerController get to => Get.find<HomeBuyerController>();

  RxBool loading = false.obs;
  RxBool isFavoriteLoading = false.obs;
  var responseMessage = "";
  RxList<Data> ads = <Data>[].obs;
  Meta meta = Meta();
  late ScrollController scrollController;

  @override
  void onInit() {
    super.onInit();
    scrollController = ScrollController();
    scrollController.addListener(_listener);
    getIndexAds();
  }

  void _listener() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      if (meta.currentPage! < meta.lastPage!) {
        getIndexAds(pageNumber: meta.currentPage);
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> getIndexAds({pageNumber = 1}) async {
    loading.value = true;
    return AdsBuyerUseCase(repository: Get.find<AdsRepository>())
        .call(pageNumber)
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
              ads.addAll(response.data ?? []);
              meta = response.meta!;
              loading.value = false;
            }));
  }

  Future<void> toggleFavorite({postId}) async {
    // isFavoriteLoading.value = true;
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
        // isFavoriteLoading.value = false;
      },
          (response) async {
              final index = ads.indexWhere((element) => element.id == postId);
              if(index != -1) {
                ads[index].isFavorite = !(ads[index].isFavorite!);
                ads.refresh();
              }
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

        // isFavoriteLoading.value = false;
      },
    ));
  }
}
