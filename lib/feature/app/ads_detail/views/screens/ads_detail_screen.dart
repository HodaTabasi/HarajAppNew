library ads_detail_buyer_view;

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:haraj/feature/app/ads_detail/controllers/ads_detail_controller.dart';
import 'package:haraj/feature/app/dashboard/buyer/gallery_buyer/views/screens/gallery_buyer_screen.dart';
import 'package:haraj/utils/extensions/color_resource/color_resource.dart';
import 'package:haraj/utils/extensions/icons_app/icons_app.dart';
import 'package:haraj/utils/extensions/images_app/images_app.dart';
import 'package:haraj/utils/extensions/main_extension/context_extension.dart';
import 'package:haraj/utils/get/general_getx_controller.dart';
import 'package:haraj/utils/prefs/shared_pref_controller.dart';
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
import 'package:haraj/widgets/custom_textformfiled.dart';
import 'package:haraj/widgets/row_divider_widget.dart';
import 'package:haraj/widgets/social_container_widget.dart';

part '../components/ads_all_offers_component.dart';
part '../components/ads_communication_component.dart';
part '../components/ads_contact_info_component.dart';
part '../components/ads_detail_component.dart';
part '../components/ads_instructions_component.dart';
part '../components/ads_offer_submit_component.dart';
part '../components/all_offers_card.dart';
part '../components/bottom_sheet_body_detail.dart';
part '../components/bottom_sheet_body_offers.dart';
part '../components/check_alert_dialog.dart';
part '../components/header_title.dart';
part '../components/input_field.dart';
part '../components/line_detail.dart';
part '../components/more_button.dart';
part '../components/offer_card.dart';
part '../components/swiper_component.dart';

class AdsDetailScreen extends StatefulWidget {
  final int productId;

  const AdsDetailScreen({
    Key? key,
    required this.productId,
  }) : super(key: key);

  @override
  State<AdsDetailScreen> createState() => _AdsDetailScreenState();
}

class _AdsDetailScreenState extends State<AdsDetailScreen> {
  late AdsDetailController
      adsDetailController; // Remove the initialization here

  @override
  void initState() {
    super.initState();
    adsDetailController =
        Get.put(AdsDetailController(productId: widget.productId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: CustomAppBar(
        //TODO:make lang here
        title: 'تفاصيل الاعلان',
        heightBackground: 100.h,
        showLeading: true,
        showSearch: false,
        showActions: true,
        actionAssetName: SharedPrefController().type == 1
            ? IconsApp.edit
            : IconsApp.favoriteOutline,
        actionIconColor: SharedPrefController().type == 1
            ? ColorResource.mainColor
            : ColorResource.gray,
        actionOnTap: () {
          SharedPrefController().type == 1
              ? Get.bottomSheet(
                  AppBottomSheet(
                    body: BottomSheetBodyOffers(),
                    height: 280.h,
                  ),
                  enterBottomSheetDuration: const Duration(milliseconds: 500),
                  exitBottomSheetDuration: const Duration(milliseconds: 400))
              : IconsApp.favoriteFill;
        },
      ),
      body: Obx(() {
        return adsDetailController.loading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SwiperComponent(id: widget.productId),
                      AppDivider(
                        height: 34.h,
                        color: ColorResource.gray,
                        thickness: 1,
                      ),
                      HeaderTitle(id: widget.productId),
                      AppDivider(
                        height: 34.h,
                        color: ColorResource.gray,
                        thickness: 1,
                      ),
                      SharedPrefController().type == 1
                          ? TabBarComponent(
                              tabTitles: [
                                context.localizations.details,
                                context.localizations.contact_info,
                                context.localizations.all_offers,
                              ],
                              tabViews: [
                                AdsDetailComponent(id: widget.productId),
                                AdsContactInfoComponent(id: widget.productId),
                                AdsAllOffersComponent(id: widget.productId),
                              ],
                              height: 250.h,
                            )
                          : TabBarComponent(
                              tabTitles: [
                                context.localizations.details,
                                context.localizations.contact,
                                context.localizations.offer_submit,
                                //TODO:Make Lang Here
                                "ارشادات",
                              ],
                              tabViews: [
                                AdsDetailComponent(id: widget.productId),
                                AdsCommunicationComponent(id: widget.productId),
                                AdsOfferSubmitComponent(id: widget.productId),
                                AdsInstructionsComponent(id: widget.productId),
                                // Other tab views
                              ],
                              height: 250.h,
                            ),
                    ]),
              );
      }),
    );
  }
}
