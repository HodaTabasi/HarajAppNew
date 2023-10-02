import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:haraj/feature/app/offer/use_case/accept_offer_use_case.dart';
import 'package:haraj/feature/app/offer/use_case/destroy_offer_use_case.dart';
import 'package:haraj/feature/app/offer/use_case/post_offer_use_case.dart';
import 'package:haraj/feature/app/offer/use_case/reject_offer_use_case.dart';
import 'package:haraj/feature/app/offer/use_case/show_post_accepted_offer_use_case.dart';
import 'package:haraj/feature/app/offer/use_case/show_post_new_offer_use_case.dart';
import 'package:haraj/feature/app/offer/use_case/show_post_rejected_offer_use_case.dart';
import 'package:haraj/feature/app/offer/views/screens/offer_screen.dart';
import 'package:haraj/utils/errors/error_const.dart';
import 'package:haraj/utils/extensions/color_resource/color_resource.dart';
import 'package:haraj/utils/models/meta/meta_model.dart';
import 'package:haraj/utils/models/offer/offer_model.dart';
import 'package:haraj/utils/repository/offer_repo/offer_repo.dart';

class OfferController extends GetxController {
  static OfferController get to => Get.find<OfferController>();

  RxBool loading = false.obs;
  var responseMessage = "";
  RxList<OfferModel> newOffers = <OfferModel>[].obs;
  RxList<OfferModel> rejectedOffers = <OfferModel>[].obs;
  RxList<OfferModel> acceptedOffers = <OfferModel>[].obs;
  Meta meta = Meta();
  OfferModel offerModel = OfferModel();
  late ScrollController scrollController;
  late TextEditingController newPriceController;

  @override
  void onInit() {
    super.onInit();
    newPriceController = TextEditingController();
    scrollController = ScrollController();
    scrollController.addListener(_listener);
    showPostNewOffer();
    showPostRejectedOffers();
    showPostAcceptedOffers();
  }

  @override
  void dispose() {
    newPriceController.dispose();
    super.dispose();
  }

  void clear() {
    newPriceController.clear();
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
              newOffers.clear();
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
              rejectedOffers.clear();
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
              acceptedOffers.clear();
              acceptedOffers.addAll(response.data ?? []);
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
                    showPostAcceptedOffers();
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
                    showPostRejectedOffers();
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

  Future<void> destroyOffer({postId}) async {
    return DestroyOfferUseCase(repository: Get.find<OfferRepository>())
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

  Future<void> performNewPrice({productId}) async {
    if (checkData()) {
      await postOfferAds(productId: productId);
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

  Future<void> postOfferAds({productId}) async {
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
              showPostNewOffer();
            }));
  }
}
