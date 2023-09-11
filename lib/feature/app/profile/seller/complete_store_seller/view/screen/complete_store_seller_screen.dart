library complete_store_seller_view;

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:haraj/feature/app/profile/seller/add_address_seller/view/screen/add_address_seller_screen.dart';
import 'package:haraj/feature/app/profile/seller/complete_store_seller/controller/complete_store_seller_controller.dart';
import 'package:haraj/utils/extensions/color_resource/color_resource.dart';
import 'package:haraj/utils/extensions/icons_app/icons_app.dart';
import 'package:haraj/utils/extensions/images_app/images_app.dart';
import 'package:haraj/utils/extensions/main_extension/context_extension.dart';
import 'package:haraj/utils/get/general_getx_controller.dart';
import 'package:haraj/widgets/app_elevated_button.dart';
import 'package:haraj/widgets/app_image.dart';
import 'package:haraj/widgets/app_svg_picture.dart';
import 'package:haraj/widgets/app_text.dart';
import 'package:haraj/widgets/custom_textformfiled.dart';
import 'package:image_picker/image_picker.dart';

part '../components/back_button.dart';
part '../components/header_image.dart';
part '../components/header_title.dart';
part '../components/image_profile.dart';
part '../components/input_field.dart';
part '../components/save_button.dart';

class CompleteStoreSellerScreen extends GetView<CompleteStoreSellerController> {
  CompleteStoreSellerController completeStoreSellerController =
      Get.put(CompleteStoreSellerController());
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
                                    title: context.localizations.save_changes,
                                    onPressed: () async {
                                      //SharedPrefController().isCompleteAddress = false;
                                       await controller.performAddStoreData();
                                      // Get.to(AddAddressSellerScreen());
                                      // Get.to(() => AddAddressSellerScreen());
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
