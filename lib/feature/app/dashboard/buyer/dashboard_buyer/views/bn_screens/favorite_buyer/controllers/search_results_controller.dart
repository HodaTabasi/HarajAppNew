import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haraj/feature/app/dashboard/buyer/dashboard_buyer/views/bn_screens/favorite_buyer/use_case/get_search_results_use_case.dart';
import 'package:haraj/utils/errors/error_const.dart';
import 'package:haraj/utils/extensions/color_resource/color_resource.dart';
import 'package:haraj/utils/models/meta/meta_model.dart';
import 'package:haraj/utils/repository/favorite_repo/favorite_repo.dart';

import '../../../../../../../../../utils/models/search_results/search_results_item_model.dart';


class SearchResultsController extends GetxController {
  static SearchResultsController get to => Get.find<SearchResultsController>();
  static SearchController get toSearch => Get.find<SearchController>();
  static bool get isPut => Get.isRegistered<SearchResultsController>();


  RxBool loading = false.obs;
  var responseMessage = "";
  RxList<SearchResultsItemModel> searchResults = <SearchResultsItemModel>[].obs;
  Meta meta = Meta();
  late ScrollController scrollController;

  @override
  void onInit() {
    super.onInit();
    scrollController = ScrollController();
    scrollController.addListener(_listener);
    // getSearchResults();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _listener() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      if (meta.currentPage! < meta.lastPage!) {
        getSearchResults(pageNumber: (meta.currentPage ?? 0) + 1);
      }
    }
  }

  Future<void> getSearchResults({pageNumber = 1}) async {
    if (pageNumber == 1) {
      searchResults.clear();
    }
    loading.value = true;
    return GetSearchResultsShowUseCase(repository: Get.find<FavoriteRepository>())
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
              searchResults.addAll(response.data ?? []);
              meta = response.meta!;
              loading.value = false;
            }));
  }

}
