library home_buyer_view;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:haraj/feature/app/dashboard/buyer/dashboard_buyer/views/bn_screens/home_buyer/controllers/home_buyer_controller.dart';
import 'package:haraj/utils/extensions/color_resource/color_resource.dart';
import 'package:haraj/utils/extensions/images_app/images_app.dart';
import 'package:haraj/utils/extensions/main_extension/context_extension.dart';
import 'package:haraj/widgets/app_ads_car_container.dart';
import 'package:haraj/widgets/app_text.dart';
import 'package:haraj/widgets/custom_appbar.dart';

part '../components/show_ads.dart';

class HomeBuyerScreen extends GetView<HomeBuyerController> {
  final HomeBuyerController homeBuyerController =
      Get.put(HomeBuyerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
        heightBackground: 290.h,
        title: context.localizations.hello,
        showLeading: false,
        showActions: false,
        showSearch: false,
        showSwiper: true,
        heightSwiper: 160.h,
        itemCountSwiper: 3,
        viewportFractionSwiper: 0.8,
        imageSwiper: ImagesApp.imageSwiper,
        showActionHomeBuyer: true,
        actionOnTapHomeBuyer: () {},
        showLeadingHomeBuyer: true,
        leadingOnTapHomeBuyer: () {},
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.symmetric(
                  horizontal: 20.w, vertical: 10.h),
              child: AppText(
                text: context.localizations.ads,
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                color: ColorResource.mainFontColor,
                textAlign: TextAlign.start,
              ),
            ),
            const Expanded(child: ShowAds()),
          ]),
    );
  }
}
