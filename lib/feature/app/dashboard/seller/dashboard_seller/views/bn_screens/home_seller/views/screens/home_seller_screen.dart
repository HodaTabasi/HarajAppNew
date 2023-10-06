library home_seller_view;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:haraj/feature/app/ads_detail/views/screens/ads_detail_screen.dart';
import 'package:haraj/feature/app/dashboard/seller/dashboard_seller/views/bn_screens/add_ads_seller/views/screens/add_seller_screen.dart';
import 'package:haraj/feature/app/dashboard/seller/dashboard_seller/views/bn_screens/home_seller/controllers/home_seller_controller.dart';
import 'package:haraj/utils/extensions/color_resource/color_resource.dart';
import 'package:haraj/utils/extensions/icons_app/icons_app.dart';
import 'package:haraj/utils/extensions/main_extension/context_extension.dart';
import 'package:haraj/widgets/app_car_container.dart';
import 'package:haraj/widgets/app_divider.dart';
import 'package:haraj/widgets/app_popup_menu_item.dart';
import 'package:haraj/widgets/app_tab_bar.dart';
import 'package:haraj/widgets/app_text.dart';
import 'package:haraj/widgets/custom_appbar.dart';
import 'package:haraj/widgets/row_divider_widget.dart';

part '../components/active_ads_component.dart';
part '../components/bottom_sheet_body.dart';
part '../components/inactive_ads_component.dart';
part '../components/subscription_renewal.dart';
part '../components/total_ads.dart';
part '../components/total_component.dart';
part '../components/total_views.dart';

class HomeSellerScreen extends GetView<HomeSellerController> {
  final HomeSellerController homeSellerController =
      Get.put(HomeSellerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
        //TODO:make lang here
        title: 'الرئيسية',
        heightBackground: 210.h,
        showLeading: false,
        showSearch: true,
        searchController: controller.searchController,
        clearOnPressed: () {
          controller.search("");
          controller.searchController.clear();
        },
        onChanged: (value) {
          controller.search(value);
        },
      ),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TotalComponent(),
              SizedBox(height: 18.h),
              TabBarComponent(
                tabTitles: [
                  context.localizations.active_ad,
                  context.localizations.inactive_ad
                ],
                tabViews: const [
                  ActiveAdsComponent(),
                  InActiveAdsComponent(),
                  // Other tab views
                ],
                height: 350.h,
              ),
            ]),
      ),
    );
  }
}
