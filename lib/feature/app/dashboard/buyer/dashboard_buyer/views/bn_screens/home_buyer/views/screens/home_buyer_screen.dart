library home_buyer_view;

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:haraj/feature/app/ads_detail/views/screens/ads_detail_screen.dart';
import 'package:haraj/feature/app/dashboard/buyer/dashboard_buyer/views/bn_screens/home_buyer/controllers/home_buyer_controller.dart';
import 'package:haraj/feature/app/dashboard/buyer/filter_buyer/view/screens/filter_buyer_screen.dart';
import 'package:haraj/utils/extensions/color_resource/color_resource.dart';
import 'package:haraj/utils/extensions/main_extension/context_extension.dart';
import 'package:haraj/widgets/app_ads_car_container.dart';
import 'package:haraj/widgets/app_text.dart';
import 'package:haraj/widgets/custom_appbar.dart';

import '../../../../../../../../../../utils/extensions/icons_app/icons_app.dart';
import '../../../../../../../../../../widgets/app_svg_picture.dart';

part '../components/show_ads.dart';
part '../components/swiper_component.dart';

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
        appSwiper: const SwiperComponent(),
        showActionHomeBuyer: true,
        actionOnTapHomeBuyer: () {},
        showLeadingHomeBuyer: true,
        leadingOnTapHomeBuyer: () {
          Get.to(() => FilterBuyerScreen());
        },
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
