library offer_seller_view;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:haraj/feature/app/ads_detail/views/screens/ads_detail_screen.dart';
import 'package:haraj/feature/app/dashboard/seller/dashboard_seller/views/bn_screens/offer_seller/controllers/offer_seller_controller.dart';
import 'package:haraj/utils/extensions/color_resource/color_resource.dart';
import 'package:haraj/utils/extensions/icons_app/icons_app.dart';
import 'package:haraj/utils/extensions/images_app/images_app.dart';
import 'package:haraj/utils/extensions/main_extension/context_extension.dart';
import 'package:haraj/widgets/app_car_container.dart';
import 'package:haraj/widgets/app_popup_menu_item.dart';
import 'package:haraj/widgets/app_tab_bar.dart';
import 'package:haraj/widgets/custom_appbar.dart';

part '../components/accepted_ads_component.dart';
part '../components/new_ads_component.dart';
part '../components/rejected_ads_component.dart';

class OfferSellerScreen extends GetView<OfferSellerController> {
  final OfferSellerController offerSellerController =
      Get.put(OfferSellerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
        title: context.localizations.offers_submitted,
        heightBackground: 130.h,
        showLeading: false,
        showSearch: false,
        showActions: false,
      ),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TabBarComponent(
                tabTitles: [
                  //TODO:Make Lange Here
                  "جديدة",
                  context.localizations.acceptable,
                  context.localizations.rejected
                ],
                tabViews: const [
                  NewAdsComponent(),
                  AcceptedAdsComponent(),
                  RejectedAdsComponent(),
                  // Other tab views
                ],
                height: 555.h,
              ),
            ]),
      ),
    );
  }
}
