import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:haraj/feature/app/dashboard/seller/dashboard_seller/views/bn_screens/profile_seller/use_case/get_profile_use_case.dart';
import 'package:haraj/utils/models/user/user_model.dart';
import 'package:haraj/utils/repository/profile_repo.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../../../../../utils/errors/error_const.dart';
import '../../../../../../../../../utils/extensions/color_resource/color_resource.dart';

class ProfileSellerController extends GetxController {
  var responseMessage = "";

  static ProfileSellerController get to => Get.find<ProfileSellerController>();

  RxBool loading = true.obs;
  RxBool isFavorite = false.obs;
  RxDouble opacity = 0.0.obs;
  UserModel? userModel  ;
  late ScrollController controller1;
  final ImagePicker picker = ImagePicker();
  List<XFile>? imageFileList = [];


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

  void selectImages() async {
    final List<XFile> selectedImages = await picker.pickMultiImage();

    if (selectedImages.isNotEmpty) {
      // Calculate how many more images can be added to reach the limit of 10.
      final remainingSlots = 10 - imageFileList!.length;

      // Only add as many images as there are remaining slots.
      imageFileList!.addAll(selectedImages.take(remainingSlots));
      update();

      debugPrint(
          'Selected image from gallery💯: ${imageFileList!.length.toString()}');
    }
  }
}
