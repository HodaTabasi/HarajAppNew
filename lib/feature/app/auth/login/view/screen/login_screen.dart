library login_view;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:haraj/feature/app/auth/login/controller/login_controller.dart';
import 'package:haraj/utils/extensions/color_resource/color_resource.dart';
import 'package:haraj/utils/extensions/icons_app/icons_app.dart';
import 'package:haraj/utils/extensions/images_app/images_app.dart';
import 'package:haraj/utils/extensions/main_extension/context_extension.dart';
import 'package:haraj/utils/extensions/routes/key_routes.dart';
import 'package:haraj/widgets/app_elevated_button.dart';
import 'package:haraj/widgets/app_image.dart';
import 'package:haraj/widgets/app_text.dart';
import 'package:haraj/widgets/custom_textformfiled.dart';
import 'package:haraj/widgets/row_divider_widget.dart';
import 'package:haraj/widgets/social_container_widget.dart';

part '../components/header_image.dart';
part '../components/header_logo.dart';
part '../components/input_field.dart';
part '../components/login_button.dart';
part '../components/terms_and_conditions.dart';
part '../components/text_button.dart';

class LoginScreen extends GetView<LoginController> {
  LoginController loginController = Get.put(LoginController());

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
                      SizedBox(height: 5.h),
                      TextButtonApp(
                        onPressed: () {},
                        title: context.localizations.forget_password,
                        color: ColorResource.gray,
                        alignment: Alignment.topLeft,
                      ),
                      SizedBox(height: 10.h),
                      Obx(() {
                        return controller.loading.isTrue
                            ? const Center(child: CircularProgressIndicator())
                            : Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20.w),
                                child: LoginButton(
                                  title: context.localizations.login,
                                  onPressed: () async {
                                    await controller.performRegister();
                                  },
                                ),
                              );
                      }),
                      SizedBox(height: 10.h),
                      TextButtonApp(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, KeyRoutes.registerScreen);
                        },
                        title: context.localizations.new_register,
                        color: ColorResource.mainColor,
                        alignment: Alignment.center,
                      ),
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
                        nameIcon: ImagesApp.twitter,
                        onPressed: () {},
                      ),
                      SocialContainer(
                        nameIcon: ImagesApp.facebook,
                        onPressed: () {},
                      ),
                      SocialContainer(
                        nameIcon: ImagesApp.google,
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
