library ads_detail_seller_view;

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:haraj/feature/app/dashboard/seller/ads_detail_seller/controllers/ads_detail_seller_controller.dart';
import 'package:haraj/utils/extensions/color_resource/color_resource.dart';
import 'package:haraj/utils/extensions/icons_app/icons_app.dart';
import 'package:haraj/utils/extensions/images_app/images_app.dart';
import 'package:haraj/utils/extensions/main_extension/context_extension.dart';
import 'package:haraj/widgets/app_body_container.dart';
import 'package:haraj/widgets/app_bottom_sheet.dart';
import 'package:haraj/widgets/app_divider.dart';
import 'package:haraj/widgets/app_elevated_button.dart';
import 'package:haraj/widgets/app_popup_menu_button.dart';
import 'package:haraj/widgets/app_popup_menu_item.dart';
import 'package:haraj/widgets/app_svg_picture.dart';
import 'package:haraj/widgets/app_tab_bar.dart';
import 'package:haraj/widgets/app_text.dart';
import 'package:haraj/widgets/custom_appbar.dart';

part '../components/ads_contact_info_component.dart';
part '../components/ads_detail_component.dart';
part '../components/ads_offers_component.dart';
part '../components/bottom_sheet_body_detail.dart';
part '../components/bottom_sheet_body_offers.dart';
part '../components/header_title.dart';
part '../components/line_detail.dart';
part '../components/more_button.dart';
part '../components/offer_card.dart';
part '../components/swiper_component.dart';

class AdsDetailSellerScreen extends GetView<AdsDetailSellerController> {
  final AdsDetailSellerController adsDetailSellerController =
      Get.put(AdsDetailSellerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
        //TODO:make lang here
        title: 'تفاصيل الاعلان',
        imageHeight: 100.h,
        showLeading: true,
        showSearch: false,
        showActions: true,
        leadingAction: () {},
      ),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SwiperComponent(),
              AppDivider(
                height: 34.h,
                color: ColorResource.gray,
                thickness: 1,
              ),
              const HeaderTitle(),
              AppDivider(
                height: 34.h,
                color: ColorResource.gray,
                thickness: 1,
              ),
              TabBarComponent(
                tabTitles: [
                  context.localizations.details,
                  context.localizations.contact_info,
                  context.localizations.all_offers
                ],
                tabViews: const [
                  AdsDetailComponent(),
                  AdsContactInfoComponent(),
                  AdsOffersComponent(),
                  // Other tab views
                ],
                height: 300.h,
              ),
            ]),
      ),
    );
  }
}
