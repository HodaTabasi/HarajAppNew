import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haraj/utils/extensions/color_resource/color_resource.dart';
import 'package:haraj/utils/models/seller_info/seller_user_model.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../../utils/errors/error_const.dart';
import '../../../../../../utils/models/seller_info/store_model.dart';
import '../../../../../../utils/prefs/shared_pref_controller.dart';
import '../../../../../../utils/repository/complete_user_repo.dart';
import '../../add_address_seller/view/screen/add_address_seller_screen.dart';
import '../use_case/complete_store_use_case.dart';

class CompleteStoreSellerController extends GetxController {
  var responseMessage = "";

  static CompleteStoreSellerController get to =>
      Get.find<CompleteStoreSellerController>();

  RxBool loading = false.obs;
  RxBool isVisibility = false.obs;
  XFile? file;
  String? imageUrl;
  bool fromEditPage = false;

  Store get store => Store(
      name: nameController.text,
      email: emailController.text,
      mobile: phoneController.text,
      commercialRegister: commercialRegistrationNumController.text,
      description: briefController.text);

  void toggleVisibility() {
    isVisibility.value = !isVisibility.value;
    update();
  }

  late TextEditingController nameController;
  late TextEditingController phoneController;
  late TextEditingController commercialRegistrationNumController;
  late TextEditingController emailController;
  late TextEditingController briefController;

  void putDataToTextField({SellerUserModel? user}) {
    if(user != null){
        nameController.text = user.store!.name ?? '';
        emailController.text = user.store!.email ?? '';
        phoneController.text = user.store!.mobile ?? '';
        commercialRegistrationNumController.text = user.store!.commercialRegister ?? '';
        briefController.text = user.store!.description ??'';
        fromEditPage = true;
        imageUrl = user.store!.avatar;
    }else {
      nameController = TextEditingController();
      phoneController = TextEditingController();
      commercialRegistrationNumController = TextEditingController();
      emailController = TextEditingController();
      briefController = TextEditingController();
      fromEditPage = false;
    }

  }

  @override
  void onInit() {
    super.onInit();
    putDataToTextField();
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    commercialRegistrationNumController.dispose();
    emailController.dispose();
    briefController.dispose();
    super.dispose();
  }

  void clear() {
    nameController.clear();
    phoneController.clear();
    commercialRegistrationNumController.clear();
    emailController.clear();
    briefController.clear();
  }

  Future<void> performAddStoreData() async {
    loading.value = true;
    if (checkData()) {
      await completeProfile();
    }
    loading.value = false;
  }



  bool checkData() {
    if (nameController.text.isNotEmpty &&
        phoneController.text.isNotEmpty &&
        commercialRegistrationNumController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        briefController.text.isNotEmpty) {
      if(!fromEditPage){
        if(file == null){
          Get.snackbar(
            'Requires',
            'select image',
            backgroundColor: ColorResource.red,
            snackPosition: SnackPosition.BOTTOM,
          );
          return false;
        }
      }
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

  Future<void> completeProfile() async {
    return CompleteStoreUseCase(
            repository: Get.find<CompletePersonalInfoRepo>())
        .call(store, file?.path)
        .then((value) => value.fold((failure) {
              responseMessage = mapFailureToMessage(failure);
              Get.snackbar(
                'Requires',
                responseMessage,
                backgroundColor: ColorResource.red,
                snackPosition: SnackPosition.BOTTOM,
              );
            }, (user) async {
          if(fromEditPage){
            Get.back();
          }else {
            Get.to(() => AddAddressSellerScreen());
          }

    }));
  }


}
