import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../../../../../../utils/errors/error_const.dart';
import '../../../../../../../../../utils/extensions/color_resource/color_resource.dart';
import '../../../../../../../../../utils/models/user/user_model.dart';
import '../../../../../../../../../utils/repository/profile_repo.dart';
import '../../../../../../seller/dashboard_seller/views/bn_screens/profile_seller/use_case/get_profile_use_case.dart';

class ProfileBuyerController extends GetxController {
  String responseMessage = "";

  static ProfileBuyerController get to => Get.find<ProfileBuyerController>();

  RxBool loading = true.obs;
  RxBool isFavorite = false.obs;
  UserModel? userModel  ;
  RxDouble opacity = 0.0.obs;
  late ScrollController controller1;


  void _listener() {
    opacity.value = controller1.position.pixels/controller1.position.maxScrollExtent;
  }

  @override
  void onInit() {
    super.onInit();
    controller1 = ScrollController();
    controller1.addListener(_listener);
    getProfile();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getProfile() {
    // EasyLoading.show(indicator: EasyLoading().indicatorWidget);
    return GetProfileUseCase(repository: Get.find<ProfileRepo>())
        .call()
        .then((value) => value.fold((failure) {
      //EasyLoading.dismiss();
      responseMessage = mapFailureToMessage(failure);
      Get.snackbar(
        'Requires',
        responseMessage,
        backgroundColor: ColorResource.red,
        snackPosition: SnackPosition.BOTTOM,
      );
    }, (user) async {
      userModel = user;
      // EasyLoading.dismiss();
    }));
  }
}
