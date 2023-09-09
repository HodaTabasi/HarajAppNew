library complete_profile_seller_view;

import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:haraj/feature/app/profile/seller/complete_profile_seller/controller/complete_profile_seller_controller.dart';
import 'package:haraj/feature/app/profile/seller/complete_store_seller/view/screen/complete_store_seller_screen.dart';
import 'package:haraj/utils/extensions/color_resource/color_resource.dart';
import 'package:haraj/utils/extensions/icons_app/icons_app.dart';
import 'package:haraj/utils/extensions/images_app/images_app.dart';
import 'package:haraj/utils/extensions/main_extension/context_extension.dart';
import 'package:haraj/utils/get/general_getx_controller.dart';
import 'package:haraj/utils/prefs/shared_pref_controller.dart';
import 'package:haraj/widgets/app_elevated_button.dart';
import 'package:haraj/widgets/app_image.dart';
import 'package:haraj/widgets/app_text.dart';
import 'package:haraj/widgets/custom_textformfiled.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../dashboard/buyer/dashboard_buyer/views/dashboard_screen.dart';

part '../components/close_button.dart';
part '../components/header_image.dart';
part '../components/header_title.dart';
part '../components/image_profile.dart';
part '../components/input_field.dart';
part '../components/save_button.dart';

class CompleteProfileSellerScreen
    extends GetView<CompleteProfileSellerController> {
  CompleteProfileSellerController completeProfileSellerController =
      Get.put(CompleteProfileSellerController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  const HeaderImage(),
                  Padding(
                    padding: EdgeInsets.only(top: 10.h),
                    child: Column(
                      children: [
                        const HeaderTitle(),
                        SizedBox(height: 24.h),
                        const ImageProfile(),
                        SizedBox(height: 30.h),
                        InputField(),
                        SizedBox(height: 15.h),
                        Obx(() {
                          return controller.loading.isTrue
                              ? const Center(child: CircularProgressIndicator())
                              : Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.w),
                                  child: SaveButton(
                                    title: context.localizations.register,
                                    onPressed: () async {
                                       // await controller.performUpdateProfile();
                                      Get.to(() => CompleteStoreSellerScreen());
                                    },
                                  ),
                                );
                        }),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
