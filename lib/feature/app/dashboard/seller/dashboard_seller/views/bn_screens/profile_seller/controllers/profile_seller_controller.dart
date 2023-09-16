import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:haraj/feature/app/dashboard/seller/dashboard_seller/views/bn_screens/profile_seller/use_case/delete_image_use_case.dart';
import 'package:haraj/feature/app/dashboard/seller/dashboard_seller/views/bn_screens/profile_seller/use_case/get_profile_use_case.dart';
import 'package:haraj/utils/models/user/user_model.dart';
import 'package:haraj/utils/repository/profile_repo.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../../../../../utils/errors/error_const.dart';
import '../../../../../../../../../utils/extensions/color_resource/color_resource.dart';
import '../../../../../../../../../utils/models/seller_info/image.dart';
import '../../../../../../../../../utils/repository/complete_user_repo.dart';
import '../use_case/add_store_image_use_case.dart';

class ProfileSellerController extends GetxController {
  var responseMessage = "";

  static ProfileSellerController get to => Get.find<ProfileSellerController>();

  RxBool loading = false.obs;
  RxBool isFavorite = false.obs;
  RxDouble opacity = 0.0.obs;
  UserModel? userModel  ;
  late ScrollController controller1;
  final ImagePicker picker = ImagePicker();
  RxList<XFile>? imageFileList = <XFile>[].obs;
  RxList<MyImage>? imageGalaryList = <MyImage>[].obs;
  List<MyImage> removedImage = [];


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
      imageGalaryList?.addAll(user.data!.store!.gallery ?? []);
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
      makeImageGallery();

      debugPrint(
          'Selected image from gallery💯: ${imageFileList!.length.toString()}');
    }
  }

  void makeImageGallery() {
    for(var file in imageFileList!){
      imageGalaryList?.add(MyImage(1, file.path,true));
    }
    imageFileList?.clear();
     update();
  }

  void updateSelected(int index, bool value) {
    imageGalaryList![index].isSelected = value;
    update();
  }

  void deleteImageFromGallery() {
    EasyLoading.show(indicator: EasyLoading().indicatorWidget);
    for(MyImage image in imageGalaryList!){
      if(image.fromFile! && image.isSelected!){
        removedImage.add(image);
        // imageGalaryList?.remove(image);
      }else if(!image.fromFile! && image.isSelected!){
        deleteImageStore(image.id);
      }
    }
    imageGalaryList?.removeWhere((element) => removedImage.contains(element));
    EasyLoading.dismiss();
     // imageGalaryList?.removeWhere((element) {
     //  return element.isSelected == true;});
     update();
  }

  deleteImageStore(id) {
    // EasyLoading.show(indicator: EasyLoading().indicatorWidget);
    return DeleteImageStoreUseCase(repository: Get.find<ProfileRepo>())
        .call(id)
        .then((value) => value.fold((failure) {
      //EasyLoading.dismiss();
      responseMessage = mapFailureToMessage(failure);
      Get.snackbar(
        'Requires',
        responseMessage,
        backgroundColor: ColorResource.red,
        snackPosition: SnackPosition.BOTTOM,
      );
    }, (response) async {
          if(response.success){
            imageGalaryList?.removeWhere((e)=>e.id == id);
            update();
          }else {
            Get.snackbar(
              'Requires',
              responseMessage,
              backgroundColor: ColorResource.red,
              snackPosition: SnackPosition.BOTTOM,
            );
          }

    }));
  }

    Future<void> addImageStore() async {
    loading.value = true;
      // EasyLoading.show(indicator: EasyLoading().indicatorWidget);
      return AddImageStoreUseCase(
          repository: Get.find<CompletePersonalInfoRepo>())
          .call(imageGalaryList!.where((p0) => p0.fromFile == true).toList())
          .then((value) => value.fold((failure) {
            loading.value = false;
        responseMessage = mapFailureToMessage(failure);
        Get.snackbar(
          'Requires',
          responseMessage,
          backgroundColor: ColorResource.red,
          snackPosition: SnackPosition.BOTTOM,
        );
        // EasyLoading.dismiss();
      }, (user) async {
        loading.value = false;
        userModel = user;
        // EasyLoading.dismiss();
      }));
    }

}
