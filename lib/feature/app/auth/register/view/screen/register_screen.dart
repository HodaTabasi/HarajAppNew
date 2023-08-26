library register_view;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:haraj/feature/app/auth/register/controller/register_controller.dart';
import 'package:haraj/feature/app/profile/buyer/complete_profile_buyer/controller/complete_profile_buyer_controller.dart';
import 'package:haraj/feature/app/profile/buyer/complete_profile_buyer/view/screen/complete_profile_buyer_screen.dart';
import 'package:haraj/feature/app/profile/seller/complete_profile_seller/controller/complete_profile_seller_controller.dart';
import 'package:haraj/feature/app/profile/seller/complete_profile_seller/view/screen/complete_profile_seller_screen.dart';
import 'package:haraj/utils/extensions/color_resource/color_resource.dart';
import 'package:haraj/utils/extensions/icons_app/icons_app.dart';
import 'package:haraj/utils/extensions/images_app/images_app.dart';
import 'package:haraj/utils/extensions/main_extension/context_extension.dart';
import 'package:haraj/utils/get/general_getx_controller.dart';
import 'package:haraj/widgets/app_elevated_button.dart';
import 'package:haraj/widgets/app_image.dart';
import 'package:haraj/widgets/app_svg_picture.dart';
import 'package:haraj/widgets/app_text.dart';
import 'package:haraj/widgets/custom_textformfiled.dart';
import 'package:haraj/widgets/row_divider_widget.dart';
import 'package:haraj/widgets/social_container_widget.dart';

part '../components/back_button.dart';
part '../components/bottom_sheet.dart';
part '../components/header_image.dart';
part '../components/header_logo.dart';
part '../components/input_field.dart';
part '../components/register_button.dart';
part '../components/register_type.dart';
part '../components/terms_and_conditions.dart';
part '../components/text_button.dart';

class RegisterScreen extends GetView<RegisterController> {
  RegisterController registerController = Get.put(RegisterController());
  GeneralGetxController generalGetxController =
      Get.put(GeneralGetxController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                const HeaderImage(),
                Padding(
                  padding: EdgeInsets.only(top: 55.h),
                  child: Column(
                    children: [
                      const HeaderLogo(),
                      SizedBox(height: 30.h),
                      InputField(),
                      SizedBox(height: 15.h),
                      Obx(() {
                        return controller.loading.isTrue
                            ? const Center(child: CircularProgressIndicator())
                            : Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20.w),
                                child: RegisterButton(
                                  title: context.localizations.register,
                                  onPressed: () async {
                                    // await controller.performRegister();
                                    Get.bottomSheet(const BottomSheet(),
                                        enterBottomSheetDuration:
                                            const Duration(milliseconds: 500),
                                        exitBottomSheetDuration:
                                            const Duration(milliseconds: 400));
                                  },
                                ),
                              );
                      }),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 24.h),
              child: Column(
                children: [
                  TermsAndConditions(
                    title: context.localizations.press,
                    onTitle: context.localizations.policy,
                    onPressed: () {},
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    height: 32.h,
                  ),
                  RowDividerWidget(
                    text: context.localizations.or,
                  ),
                  SizedBox(
                    height: 42.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocialContainer(
                        nameIcon: IconsApp.twitter,
                        onPressed: () {},
                      ),
                      SocialContainer(
                        nameIcon: IconsApp.facebook,
                        onPressed: () {},
                      ),
                      SocialContainer(
                        nameIcon: IconsApp.google,
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
