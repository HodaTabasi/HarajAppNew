library filter_buyer_view;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:haraj/feature/app/dashboard/buyer/filter_buyer/controllers/filter_buyer_controller.dart';
import 'package:haraj/utils/extensions/color_resource/color_resource.dart';
import 'package:haraj/utils/extensions/icons_app/icons_app.dart';
import 'package:haraj/utils/extensions/images_app/images_app.dart';
import 'package:haraj/utils/extensions/main_extension/context_extension.dart';
import 'package:haraj/widgets/app_body_container.dart';
import 'package:haraj/widgets/app_bottom_sheet.dart';
import 'package:haraj/widgets/app_container_open_bottom_sheet.dart';
import 'package:haraj/widgets/app_divider.dart';
import 'package:haraj/widgets/app_elevated_button.dart';
import 'package:haraj/widgets/app_selectable_container.dart';
import 'package:haraj/widgets/app_selection_bottom_sheet.dart';
import 'package:haraj/widgets/app_text.dart';
import 'package:haraj/widgets/custom_appbar.dart';

part '../components/bottom_sheet_body.dart';
part '../components/done_button.dart';
part '../components/filter_buyer_component.dart';

class FilterBuyerScreen extends GetView<FilterBuyerController> {
  final FilterBuyerController filterBuyerController =
      Get.put(FilterBuyerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
        heightBackground: 100.h,
        title: context.localizations.filter,
        showLeading: true,
        showActions: false,
        showSearch: false,
        showSwiper: false,
        heightSwiper: 0.h,
        itemCountSwiper: 0,
        viewportFractionSwiper: 0.8,
        imageSwiper: ImagesApp.imageSwiper,
        showActionHomeBuyer: false,
        actionOnTapHomeBuyer: () {},
        showLeadingHomeBuyer: false,
        leadingOnTapHomeBuyer: () {},
      ),
      body: Padding(
        padding: EdgeInsetsDirectional.symmetric(horizontal: 20.w),
        child: AppBodyContainer(
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    text: context.localizations.filter_results_by,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: ColorResource.gray,
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: 16.h),
                  FilterBuyerComponent(),
                ]),
          ),
        ),
      ),
    );
  }
}
