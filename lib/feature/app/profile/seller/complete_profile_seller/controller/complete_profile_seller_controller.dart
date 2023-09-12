import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haraj/feature/app/dashboard/seller/dashboard_seller/views/bn_screens/profile_seller/controllers/profile_seller_controller.dart';
import 'package:haraj/utils/extensions/color_resource/color_resource.dart';
import 'package:haraj/utils/models/seller_info/seller_user_model.dart';
import 'package:haraj/utils/prefs/shared_pref_controller.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../../utils/api_controller/complete_user_profile_controller.dart';
import '../../../../../../utils/errors/error_const.dart';
import '../../../../../../utils/repository/complete_user_repo.dart';
import '../../complete_store_seller/view/screen/complete_store_seller_screen.dart';
import '../use_case/complete_profile_use_case.dart';

class CompleteProfileSellerController extends GetxController {
  var responseMessage = "";

  static CompleteProfileSellerController get to =>
      Get.find<CompleteProfileSellerController>();

  RxBool loading = false.obs;
  RxBool isVisibility = false.obs;
  XFile? file;
  String? imageUrl;
  bool fromEditPage = false;

  SellerUserModel get userModel => SellerUserModel(
        nickName: nickNameController.text,
        name: nameController.text,
        mobile: phoneController.text,
        ssn: idController.text,
      );

  void toggleVisibility() {
    isVisibility.value = !isVisibility.value;
    update();
  }

  putDataToTextField({SellerUserModel? user}) {
    if (user != null) {
      nameController.text = user.name!;
      phoneController.text = user.mobile!;
      idController.text = user.ssn!;
      nickNameController.text = user.nickName!;
      imageUrl = user.avatar;
      fromEditPage = true;
    } else {
      nameController = TextEditingController();
      phoneController = TextEditingController();
      idController = TextEditingController();
      nickNameController = TextEditingController();
      fromEditPage = false;
    }
  }

  late TextEditingController nameController;
  late TextEditingController phoneController;
  late TextEditingController idController;
  late TextEditingController nickNameController;

  @override
  void onInit() {
    super.onInit();
    putDataToTextField();
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    idController.dispose();
    nickNameController.dispose();
    super.dispose();
  }

  void clear() {
    nameController.clear();
    phoneController.clear();
    idController.clear();
    nickNameController.clear();
  }

  Future<void> performUpdateProfile() async {
    loading.value = true;
    if (checkData()) {
      await completeProfile();
    }
    loading.value = false;
  }

  bool checkData() {
    if (nameController.text.isNotEmpty &&
        phoneController.text.isNotEmpty &&
        idController.text.isNotEmpty &&
        nickNameController.text.isNotEmpty ) {
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

  completeProfile() async {
    return CompleteProfileUseCase(
            repository: Get.find<CompletePersonalInfoRepo>())
        .call(userModel, file?.path)
        .then((value) => value.fold((failure) {
              responseMessage = mapFailureToMessage(failure);
              Get.snackbar(
                'Requires',
                responseMessage,
                backgroundColor: ColorResource.red,
                snackPosition: SnackPosition.BOTTOM,
              );
            }, (user) async {
              if (fromEditPage) {
                ProfileSellerController.to.userModel = user;
                Get.back();
              } else {
                SharedPrefController().isCompleteStore = false;
                SharedPrefController().isCompleteProfile = true;
                Get.to(() => CompleteStoreSellerScreen());
              }
            }));
  }
}
