import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:haraj/feature/app/dashboard/seller/dashboard_seller/views/bn_screens/home_seller/use_case/destroy_post_use_case.dart';
import 'package:haraj/feature/app/dashboard/seller/dashboard_seller/views/bn_screens/home_seller/use_case/sold_post_use_case.dart';
import 'package:haraj/feature/app/dashboard/seller/dashboard_seller/views/bn_screens/home_seller/use_case/store_post_use_case.dart';
import 'package:haraj/utils/errors/error_const.dart';
import 'package:haraj/utils/extensions/color_resource/color_resource.dart';
import 'package:haraj/utils/models/meta/meta_model.dart';
import 'package:haraj/utils/models/offer/post_model.dart';
import 'package:haraj/utils/prefs/shared_pref_controller.dart';
import 'package:haraj/utils/repository/store_repo/store_repo.dart';

class HomeSellerController extends GetxController {
  static HomeSellerController get to => Get.find<HomeSellerController>();

  RxBool loading = false.obs;
  var responseMessage = "";
  RxList<PostModel> searchAdsList = <PostModel>[].obs;
  RxList<PostModel> originalListAds = <PostModel>[].obs;
  Meta meta = Meta();
  PostModel postModel = PostModel();
  late ScrollController scrollController;
  TextEditingController searchController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    scrollController = ScrollController();
    scrollController.addListener(_listener);
    getStorePost();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _listener() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      if (meta.currentPage! < meta.lastPage!) {
        getStorePost(pageNumber: meta.currentPage);
      }
    }
  }

  void search(String carName) {
    if (carName.isNotEmpty) {
      searchAdsList.value = originalListAds
          .where((element) => element.car!.name
              .toString()
              .toLowerCase()
              .contains(carName.toString().toLowerCase()))
          .toList();
    } else {
      searchAdsList.value = originalListAds;
    }
  }

  Future<void> getStorePost({pageNumber = 1}) async {
    loading.value = true;
    return StorePostShowUseCase(repository: Get.find<StoreRepository>())
        .call(SharedPrefController().storeId, pageNumber)
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
              print("mmm 😎=>${SharedPrefController().storeId}");
              originalListAds.addAll(response.data ?? []);
              searchAdsList.value = originalListAds;
              meta = response.meta!;
              loading.value = false;
            }));
  }

  destroyPost({adsId}) {
    return DestroyPostShowUseCase(repository: Get.find<StoreRepository>())
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
              print("mmm0 😎=>$adsId");
              print("mmm outside response 😎=>${response.message}");
              if (response.success) {
                print("mmm inside response 😎=>${response.message}");
                int index = originalListAds
                    .indexWhere((element) => element.id == adsId);
                print("mmm inside indexWhere 😎=>${index}");
                if (index != -1) {
                  print("mmm inside index 😎=>${index}");
                  print("mmm inside index 😎=>${originalListAds.length}");
                  originalListAds.removeAt(index);
                  print("mmm inside index 😎=>${originalListAds.length}");
                  update();
                  print("mmm inside index 😎=>${originalListAds.length}");
                }
              } else {
                Get.snackbar(
                  'Requires',
                  responseMessage,
                  backgroundColor: ColorResource.red,
                  snackPosition: SnackPosition.BOTTOM,
                );
              }
            }));
  }

  Future<void> soldPost({postId}) async {
    return SoldPostShowUseCase(repository: Get.find<StoreRepository>())
        .call(postId)
        .then((value) => value.fold((failure) {
              responseMessage = mapFailureToMessage(failure);
              Get.snackbar(
                'Requires',
                responseMessage,
                backgroundColor: ColorResource.red,
                snackPosition: SnackPosition.BOTTOM,
              );
            }, (response) async {
              postModel = response;
              Get.snackbar(
                'Congratulations',
                "The car was sold successfully",
                backgroundColor: ColorResource.greenWhatsup,
                snackPosition: SnackPosition.BOTTOM,
              );
            }));
  }
}
