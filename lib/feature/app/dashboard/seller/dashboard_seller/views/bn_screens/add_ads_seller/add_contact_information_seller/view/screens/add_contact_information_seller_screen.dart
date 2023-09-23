library add_contact_information_seller_view;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:haraj/utils/extensions/color_resource/color_resource.dart';
import 'package:haraj/utils/extensions/icons_app/icons_app.dart';
import 'package:haraj/utils/extensions/main_extension/context_extension.dart';
import 'package:haraj/widgets/app_body_container.dart';
import 'package:haraj/widgets/app_bottom_sheet.dart';
import 'package:haraj/widgets/app_divider.dart';
import 'package:haraj/widgets/app_elevated_button.dart';
import 'package:haraj/widgets/app_svg_picture.dart';
import 'package:haraj/widgets/app_switch_button.dart';
import 'package:haraj/widgets/app_text.dart';
import 'package:haraj/widgets/custom_appbar.dart';
import 'package:haraj/widgets/custom_textformfiled.dart';

import '../../controllers/add_contact_information_seller_controller.dart';

part '../components/bottom_sheet_body.dart';
part '../components/done_button.dart';
part '../components/image_profile.dart';
part '../components/input_field.dart';

class AddContactInformationSellerScreen
    extends GetView<AddContactInformationSellerController> {
  final AddContactInformationSellerController
      addContactInformationSellerController =
      Get.put(AddContactInformationSellerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
        title: context.localizations.add_contact_information,
        heightBackground: 130.h,
        showLeading: true,
        showSearch: false,
        showActions: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: AppBodyContainer(
          body: Column(
            children: [
              const ImageProfile(),
              SizedBox(height: 24.h),
              AppText(
                text: context.localizations.add_new_communication,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: ColorResource.mainFontColor,
              ),
              SizedBox(height: 24.h),
              InputField(),
              AppDivider(
                height: 40.h,
                color: ColorResource.gray,
                thickness: 1,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AppText(
                    text: context.localizations.stop_phone,
                    color: ColorResource.gray,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  const Spacer(),
                  AppSwitchButton(),
                ],
              ),
              SizedBox(height: 12.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AppText(
                    text: context.localizations.stop_chat,
                    color: ColorResource.gray,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  const Spacer(),
                  AppSwitchButton(),
                ],
              ),
              const Spacer(),
              DoneButton(
                title: context.localizations.publish_ad,
                onPressed: () {
                  Get.bottomSheet(
                      AppBottomSheet(
                        body: const BottomSheetBody(),
                        height: 390.h,
                      ),
                      enterBottomSheetDuration:
                          const Duration(milliseconds: 500),
                      exitBottomSheetDuration:
                          const Duration(milliseconds: 400));
                },
              ),
            ],
          ),
          verticalMargin: 15.h,
        ),
      ),
    );
  }
}
