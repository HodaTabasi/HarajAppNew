library favorite_buyer_view;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:haraj/feature/app/dashboard/buyer/ads_detail_buyer/views/screens/ads_detail_buyer_screen.dart';
import 'package:haraj/feature/app/dashboard/buyer/dashboard_buyer/views/bn_screens/favorite_buyer/controllers/favorite_buyer_controller.dart';
import 'package:haraj/utils/extensions/color_resource/color_resource.dart';
import 'package:haraj/utils/extensions/images_app/images_app.dart';
import 'package:haraj/utils/extensions/main_extension/context_extension.dart';
import 'package:haraj/widgets/app_ads_car_container.dart';
import 'package:haraj/widgets/app_favorite_container.dart';
import 'package:haraj/widgets/app_tab_bar.dart';
import 'package:haraj/widgets/custom_appbar.dart';
import 'package:haraj/widgets/row_divider_widget.dart';

part '../components/saved_ads_component.dart';
part '../components/saved_searches_component.dart';

class FavoriteBuyerScreen extends GetView<FavoriteBuyerController> {
  final FavoriteBuyerController favoriteBuyerController =
      Get.put(FavoriteBuyerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
        title: context.localizations.archive,
        heightBackground: 100.h,
        showLeading: false,
        showSearch: false,
        showActions: false,
      ),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TabBarComponent(
                tabTitles: [
                  context.localizations.saved_ads,
                  context.localizations.saved_searches,
                ],
                tabViews: const [
                  SavedAdsComponent(),
                  SavedSearchComponent(),
                  // Other tab views
                ],
                height: 580.h,
              ),
            ]),
      ),
    );
  }
}
