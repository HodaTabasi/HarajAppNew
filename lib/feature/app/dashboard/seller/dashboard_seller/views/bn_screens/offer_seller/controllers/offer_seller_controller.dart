import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:haraj/feature/app/dashboard/seller/dashboard_seller/views/bn_screens/offer_seller/use_case/accept_offer_use_case.dart';
import 'package:haraj/feature/app/dashboard/seller/dashboard_seller/views/bn_screens/offer_seller/use_case/show_post_accepted_offer_use_case.dart';
import 'package:haraj/feature/app/dashboard/seller/dashboard_seller/views/bn_screens/offer_seller/use_case/show_post_new_offer_use_case.dart';
import 'package:haraj/feature/app/dashboard/seller/dashboard_seller/views/bn_screens/offer_seller/use_case/show_post_rejected_offer_use_case.dart';
import 'package:haraj/utils/errors/error_const.dart';
import 'package:haraj/utils/extensions/color_resource/color_resource.dart';
import 'package:haraj/utils/models/meta/meta_model.dart';
import 'package:haraj/utils/models/offer/offer_model.dart';
import 'package:haraj/utils/repository/offer_repo/offer_repo.dart';

class OfferSellerController extends GetxController {
  static OfferSellerController get to => Get.find<OfferSellerController>();

  RxBool loading = false.obs;
  var responseMessage = "";
  RxList<OfferModel> newOffers = <OfferModel>[].obs;
  RxList<OfferModel> rejectedOffers = <OfferModel>[].obs;
  RxList<OfferModel> acceptedOffers = <OfferModel>[].obs;
  Meta meta = Meta();
  late ScrollController scrollController;

  @override
  void onInit() {
    super.onInit();
    scrollController = ScrollController();
    scrollController.addListener(_listener);
    showPostNewOffer();
    showPostRejectedOffers();
    showPostAcceptedOffers();
  }

  void _listener() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      if (meta.currentPage! < meta.lastPage!) {
        showPostNewOffer(pageNumber: meta.currentPage);
        showPostRejectedOffers(pageNumber: meta.currentPage);
        showPostAcceptedOffers(pageNumber: meta.currentPage);
      }
    }
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

  Future<void> showPostRejectedOffers({pageNumber = 1}) async {
    return ShowPostRejectedOfferUseCase(repository: Get.find<OfferRepository>())
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
              rejectedOffers.addAll(response.data ?? []);
              meta = response.meta!;
            }));
  }

  Future<void> showPostAcceptedOffers({pageNumber = 1}) async {
    return ShowPostAcceptedOfferUseCase(repository: Get.find<OfferRepository>())
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
              acceptedOffers.addAll(response.data ?? []);
              meta = response.meta!;
            }));
  }

  Future<void> acceptOffer({postId}) async {
    debugPrint("mmm stare acceptOffer 💯=> $postId");
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
                // acceptedOffers = response;
                //FOR TESTING
                debugPrint("mmm stare acceptOffer 💯=> $response");
                debugPrint("mmm stare acceptOffer 💯=> $postId");
                int index = newOffers
                    .indexWhere((element) => element.postId! == postId);
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
}
