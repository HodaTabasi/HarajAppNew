library offer_view;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:haraj/feature/app/ads_detail/views/screens/ads_detail_screen.dart';
import 'package:haraj/feature/app/chat/view/screen/home_chat_screen.dart';
import 'package:haraj/feature/app/offer/controllers/offer_controller.dart';
import 'package:haraj/utils/extensions/color_resource/color_resource.dart';
import 'package:haraj/utils/extensions/icons_app/icons_app.dart';
import 'package:haraj/utils/extensions/images_app/images_app.dart';
import 'package:haraj/utils/extensions/main_extension/context_extension.dart';
import 'package:haraj/utils/get/general_getx_controller.dart';
import 'package:haraj/utils/prefs/shared_pref_controller.dart';
import 'package:haraj/widgets/app_bottom_sheet.dart';
import 'package:haraj/widgets/app_car_container.dart';
import 'package:haraj/widgets/app_divider.dart';
import 'package:haraj/widgets/app_elevated_button.dart';
import 'package:haraj/widgets/app_popup_menu_item.dart';
import 'package:haraj/widgets/app_svg_picture.dart';
import 'package:haraj/widgets/app_tab_bar.dart';
import 'package:haraj/widgets/app_text.dart';
import 'package:haraj/widgets/custom_appbar.dart';
import 'package:haraj/widgets/custom_textformfiled.dart';

part '../components/accepted_ads_component.dart';
part '../components/alert_dialog.dart';
part '../components/bottom_sheet_body_detail.dart';
part '../components/check_alert_dialog.dart';
part '../components/input_field.dart';
part '../components/new_ads_component.dart';
part '../components/rejected_ads_component.dart';
part '../components/send_edit_button.dart';

class OfferScreen extends GetView<OfferController> {
  final OfferController offerController = Get.put(OfferController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
        title: context.localizations.offers_submitted,
        heightBackground: 130.h,
        showLeading: SharedPrefController().type == 1 ? false : true,
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
                  SharedPrefController().type == 1
                      ? "جديدة"
                      : context.localizations.waiting,
                  context.localizations.acceptable,
                  context.localizations.rejected
                ],
                tabViews: const [
                  NewAdsComponent(),
                  AcceptedAdsComponent(),
                  RejectedAdsComponent(),
                  // Other tab views
                ],
                height: SharedPrefController().type == 1 ? 555.h : 640.h,
              ),
            ]),
      ),
    );
  }
}
