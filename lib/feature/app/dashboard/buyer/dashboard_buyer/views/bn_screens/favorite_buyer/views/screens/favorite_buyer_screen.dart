library favorite_buyer_view;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:haraj/feature/app/dashboard/buyer/dashboard_buyer/views/bn_screens/favorite_buyer/controllers/favorite_buyer_controller.dart';
import 'package:haraj/feature/app/dashboard/seller/add_contact_information_seller/view/screens/add_contact_information_seller_screen.dart';
import 'package:haraj/utils/extensions/color_resource/color_resource.dart';
import 'package:haraj/utils/extensions/main_extension/context_extension.dart';
import 'package:haraj/widgets/app_body_container.dart';
import 'package:haraj/widgets/app_text.dart';
import 'package:haraj/widgets/custom_appbar.dart';

// part '../components/add_component.dart';
// part '../screens/add_seller_third_page.dart';

class FavoriteBuyerScreen extends GetView<FavoriteBuyerController> {
  final FavoriteBuyerController favoriteBuyerController =
      Get.put(FavoriteBuyerController());

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
            ],
          ),
          verticalMargin: 15.h,
        ),
      ),
    );
  }
}
