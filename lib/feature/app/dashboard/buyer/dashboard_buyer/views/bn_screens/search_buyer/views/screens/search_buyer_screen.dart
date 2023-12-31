library search_buyer_view;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:haraj/feature/app/ads_detail/views/screens/ads_detail_screen.dart';
import 'package:haraj/feature/app/dashboard/buyer/dashboard_buyer/views/bn_screens/search_buyer/controllers/search_buyer_controller.dart';
import 'package:haraj/feature/app/profile/seller/add_address_seller/controller/add_address_seller_controller.dart';
import 'package:haraj/utils/extensions/color_resource/color_resource.dart';
import 'package:haraj/utils/extensions/icons_app/icons_app.dart';
import 'package:haraj/utils/extensions/images_app/images_app.dart';
import 'package:haraj/utils/extensions/main_extension/context_extension.dart';
import 'package:haraj/utils/models/governorates_model/governorate_model.dart';
import 'package:haraj/utils/models/seller_info/image.dart';
import 'package:haraj/widgets/app_ads_car_container.dart';
import 'package:haraj/widgets/app_body_container.dart';
import 'package:haraj/widgets/app_bottom_sheet.dart';
import 'package:haraj/widgets/app_car_container.dart';
import 'package:haraj/widgets/app_container_open_bottom_sheet.dart';
import 'package:haraj/widgets/app_divider.dart';
import 'package:haraj/widgets/app_elevated_button.dart';
import 'package:haraj/widgets/app_popup_menu_item.dart';
import 'package:haraj/widgets/app_selection_bottom_sheet.dart';
import 'package:haraj/widgets/app_svg_picture.dart';
import 'package:haraj/widgets/app_text.dart';
import 'package:haraj/widgets/custom_appbar.dart';
import 'package:haraj/widgets/row_divider_widget.dart';

import '../../../../../../../../../../utils/models/general/general_model.dart';
import '../../../../../../../../../../utils/models/governorates_model/citiey_model.dart';
import '../../../../../../../seller/dashboard_seller/views/bn_screens/add_ads_seller/controllers/add_ads_seller_controller.dart';
import '../../../../../../../seller/dashboard_seller/views/bn_screens/add_ads_seller/views/screens/add_seller_screen.dart';

part '../components/bottom_sheet_body.dart';
part '../components/bottom_sheet_body_governorates.dart';
part '../components/bottom_sheet_body_cities.dart';
part '../components/done_button.dart';
part '../components/search_component.dart';
part '../components/show_ads.dart';
part '../screens/search_results_buyer_screen.dart';
part '../components/no_result_component.dart';

class SearchBuyerScreen extends GetView<SearchBuyerController> {
  final SearchBuyerController searchBuyerController =
      Get.put(SearchBuyerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
        title: context.localizations.search,
        heightBackground: 180.h,
        showLeading: false,
        showSearch: true,
        showActions: false,
        clearOnPressed: (){
          searchBuyerController.keyWordController.clear();
          searchBuyerController.keyword.value = "";
        },
        searchController: searchBuyerController.keyWordController,
        onChanged: (val){
          searchBuyerController.keyword.value = val;
        },
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SearchBuyerComponent(),
            AppDivider(
              height: 10.h,
              color: ColorResource.gray,
              thickness: 1,
            ),
            //TODO LATER

            // SizedBox(height: 5.h),
            // AppText(
            //   text: context.localizations.ads_you_may_like,
            //   fontSize: 16.sp,
            //   fontWeight: FontWeight.w400,
            //   color: ColorResource.mainFontColor,
            //   textAlign: TextAlign.start,
            // ),
            //TODO LATER
            // const Expanded(child: ShowAds()),
          ],
        ),
      ),
    );
  }
}
