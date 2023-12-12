import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:haraj/feature/app/dashboard/buyer/dashboard_buyer/views/bn_screens/favorite_buyer/use_case/get_favorite_ads_use_case.dart';
import 'package:haraj/feature/app/dashboard/buyer/dashboard_buyer/views/bn_screens/favorite_buyer/use_case/post_favorite_ads_use_case.dart';
import 'package:haraj/utils/errors/error_const.dart';
import 'package:haraj/utils/extensions/color_resource/color_resource.dart';
import 'package:haraj/utils/models/meta/meta_model.dart';
import 'package:haraj/utils/models/offer/post_model.dart';
import 'package:haraj/utils/repository/favorite_repo/favorite_repo.dart';



class FavoriteBuyerController extends GetxController {
  static FavoriteBuyerController get to => Get.find<FavoriteBuyerController>();
  static bool get isPut => Get.isRegistered<FavoriteBuyerController>();


  RxBool loading = false.obs;
  var responseMessage = "";
  RxList<PostModel> savedAds = <PostModel>[].obs;
  Meta meta = Meta();
  late ScrollController scrollController;

  @override
  void onInit() {
    super.onInit();
    scrollController = ScrollController();
    scrollController.addListener(_listener);
    getFavoritePost();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _listener() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      if (meta.currentPage! < meta.lastPage!) {
        getFavoritePost(pageNumber: meta.currentPage);
      }
    }
  }

  Future<void> getFavoritePost({pageNumber = 1}) async {
    savedAds.clear();
    loading.value = true;
    return GetFavoriteAdsShowUseCase(repository: Get.find<FavoriteRepository>())
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
              savedAds.addAll(response.data ?? []);
              meta = response.meta!;
              loading.value = false;
            }));
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
              int index = savedAds.indexWhere((element) => element.id == adsId);
              if (index != -1) {
                savedAds.removeAt(index);
                update();
              }
            }));
  }
}
