library add_address_seller_view;

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:haraj/feature/app/profile/seller/add_address_seller/controller/add_address_seller_controller.dart';
import 'package:haraj/feature/app/profile/seller/add_address_seller/view/components/custom_rich_text.dart';
import 'package:haraj/feature/app/profile/seller/subscription_seller/view/screen/subscription_seller_screen.dart';
import 'package:haraj/utils/extensions/color_resource/color_resource.dart';
import 'package:haraj/utils/extensions/icons_app/icons_app.dart';
import 'package:haraj/utils/extensions/images_app/images_app.dart';
import 'package:haraj/utils/extensions/main_extension/context_extension.dart';
import 'package:haraj/utils/get/general_getx_controller.dart';
import 'package:haraj/widgets/app_divider.dart';
import 'package:haraj/widgets/app_elevated_button.dart';
import 'package:haraj/widgets/app_image.dart';
import 'package:haraj/widgets/app_svg_picture.dart';
import 'package:haraj/widgets/app_text.dart';
import 'package:haraj/widgets/custom_textformfiled.dart';

import '../../../../../../../utils/models/governorates_model/citiey_model.dart';
import '../../../../../../../utils/models/governorates_model/governorate_model.dart';

part '../components/address_component.dart';
part '../components/back_button.dart';
part '../components/bottom_sheet.dart';
part '../components/bottom_sheet_success.dart';
part '../components/city_selection.dart';
part '../components/header_image.dart';
part '../components/header_title.dart';
part '../components/input_field.dart';
part '../components/save_button.dart';
part '../screen/map_screen.dart';

class AddAddressSellerScreen extends GetView<AddAddressSellerController> {
  AddAddressSellerController addAddressSellerController =
      Get.put(AddAddressSellerController());

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
                                      bool flag = await controller.performAddress() ?? false;
                                      // Get.to(() => AddAddressSellerScreen());
                                      if(flag){
                                        Get.bottomSheet(
                                            const BottomSheetSuccess(),
                                            enterBottomSheetDuration:
                                            const Duration(milliseconds: 500),
                                            exitBottomSheetDuration:
                                            const Duration(
                                                milliseconds: 400));
                                      }
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
