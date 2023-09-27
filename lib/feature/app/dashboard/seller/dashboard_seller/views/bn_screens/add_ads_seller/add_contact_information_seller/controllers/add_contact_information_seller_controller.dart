import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../../../utils/errors/error_const.dart';
import '../../../../../../../../../../utils/extensions/color_resource/color_resource.dart';
import '../../../../../../../../../../utils/repository/ads_repo/ads_repo.dart';
import '../../use_case/add_social_contact_info_use_case.dart';

class AddContactInformationSellerController extends GetxController {
  var responseMessage = "";

  static AddContactInformationSellerController get to =>
      Get.find<AddContactInformationSellerController>();

  RxBool loading = true.obs;
  RxBool isFavorite = false.obs;

  late TextEditingController whatsappController;
  late TextEditingController facebookController;

  bool chat = false;
  bool mobile = false;

  bool facebook = false;
  bool whatsApp = false;
  int? postIdAfterAdding;



  @override
  void onInit() {
    super.onInit();
    whatsappController = TextEditingController();
    facebookController = TextEditingController();
  }

  @override
  void dispose() {
    whatsappController.dispose();
    facebookController.dispose();
    super.dispose();
  }

  void clear() {
    whatsappController.clear();
    facebookController.clear();
  }

  Future<void> addStoreAds(postId) async {
    return AddAdsSocialContactUseCase(repository: Get.find<AdsRepository>())
        .call(whatsApp?1:0,facebook?1:0,whatsappController.text,facebookController.text,mobile?1:0,chat?1:0,postIdAfterAdding ?? postId)
        .then((value) => value.fold((failure) {
      responseMessage = mapFailureToMessage(failure);
      Get.snackbar(
        'Requires',
        responseMessage,
        backgroundColor: ColorResource.red,
        snackPosition: SnackPosition.BOTTOM,
      );
    }, (response) async {
      print("mmm Add Ads Detail Buyer Controller 💯=>  ");
    }));
  }
}
