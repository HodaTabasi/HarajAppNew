library forget_password_view;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:haraj/feature/app/auth/forget_password/controller/forget_password_controller.dart';
import 'package:haraj/utils/extensions/color_resource/color_resource.dart';
import 'package:haraj/utils/extensions/icons_app/icons_app.dart';
import 'package:haraj/utils/extensions/images_app/images_app.dart';
import 'package:haraj/utils/extensions/main_extension/context_extension.dart';
import 'package:haraj/utils/extensions/routes/key_routes.dart';
import 'package:haraj/utils/get/general_getx_controller.dart';
import 'package:haraj/widgets/app_elevated_button.dart';
import 'package:haraj/widgets/app_image.dart';
import 'package:haraj/widgets/app_svg_picture.dart';
import 'package:haraj/widgets/app_text.dart';
import 'package:haraj/widgets/custom_textformfiled.dart';

import '../widget/forget_password_otp_form.dart';


part '../components/header_image.dart';
part '../components/header_logo.dart';
part '../components/input_field.dart';
part '../components/send_code_button.dart';
part '../components/terms_and_conditions.dart';
part '../components/text_button.dart';
part '../components/login_button.dart';
part '../components/back_button.dart';
part '../components/password_input_field.dart';
part '../components/change_password_button.dart';
part '../screen/add_password_screen.dart';
part '../screen/otp_screen.dart';



class ForgetPasswordScreen extends GetView<ForgetPasswordController> {
  ForgetPasswordController loginController = Get.put(ForgetPasswordController());
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
                      SizedBox(height: 5.h),
                      Obx(() {
                        return controller.loading.isTrue
                            ? const Center(child: CircularProgressIndicator())
                            : Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20.w),
                                child: LoginButton(
                                  title: context.localizations.send,
                                  onPressed: () async {
                                    await controller.performReSend();
                                  },
                                ),
                              );
                      }),
                      SizedBox(height: 10.h),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
