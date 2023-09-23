library add_ads_seller_view;

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:haraj/feature/app/dashboard/seller/add_contact_information_seller/view/screens/add_contact_information_seller_screen.dart';
import 'package:haraj/feature/app/dashboard/seller/dashboard_seller/views/bn_screens/add_ads_seller/controllers/add_ads_seller_controller.dart';
import 'package:haraj/utils/extensions/color_resource/color_resource.dart';
import 'package:haraj/utils/extensions/icons_app/icons_app.dart';
import 'package:haraj/utils/extensions/images_app/images_app.dart';
import 'package:haraj/utils/extensions/main_extension/context_extension.dart';
import 'package:haraj/utils/models/general/general_model.dart';
import 'package:haraj/widgets/app_body_container.dart';
import 'package:haraj/widgets/app_bottom_sheet.dart';
import 'package:haraj/widgets/app_divider.dart';
import 'package:haraj/widgets/app_elevated_button.dart';
import 'package:haraj/widgets/app_selectable_container.dart';
import 'package:haraj/widgets/app_svg_picture.dart';
import 'package:haraj/widgets/app_switch_button.dart';
import 'package:haraj/widgets/app_text.dart';
import 'package:haraj/widgets/custom_appbar.dart';
import 'package:haraj/widgets/custom_textformfiled.dart';
import 'package:haraj/widgets/time_line_content.dart';
import 'package:haraj/widgets/time_line_indicator.dart';

import '../../../profile_seller/controllers/profile_seller_controller.dart';

part '../components/add_component.dart';
part '../components/alert_dialog.dart';
part '../components/bottom_sheet_body.dart';
part '../components/bottom_sheet_body_success.dart';
part '../components/car_brand_selection.dart';
part '../components/custom_text_file.dart';
part '../components/done_button.dart';
part '../components/image_profile.dart';
part '../components/page_time_line.dart';
part '../components/selectable_options.dart';
part '../components/show_photo.dart';
part '../screens/add_seller_first_page.dart';
part '../screens/add_seller_fourth_page.dart';
part '../screens/add_seller_second_page.dart';
part '../screens/add_seller_third_page.dart';

class AddAdsSellerScreen extends GetView<AddAdsSellerController> {
  final AddAdsSellerController addAdsSellerController =
      Get.put(AddAdsSellerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
        title: context.localizations.add_Ad,
        heightBackground: 130.h,
        showLeading: false,
        showSearch: false,
        showActions: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: AppBodyContainer(
            body: Column(
              children: [
                const ImageProfile(),
                SizedBox(height: 24.h),
                AppText(
                  text: context.localizations.basic_car_info,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: ColorResource.mainFontColor,
                ),
                SizedBox(height: 24.h),
                const PageTimeLine(),
              ],
            ),
            verticalMargin: 15.h,
          ),
        ),
      ),
    );
  }
}
