import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:haraj/feature/app/auth/otp/view/widget/otp_form.dart';
import 'package:haraj/feature/app/auth/register/view/screen/register_screen.dart';
import 'package:haraj/widgets/app_elevated_button.dart';

import '../../../../../../utils/extensions/color_resource/color_resource.dart';
import '../../controller/otp_controller.dart';

class OTPScreen extends StatefulWidget {

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  OTPGetxController controller = Get.put(OTPGetxController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                const HeaderImage(),
                Padding(
                  padding: EdgeInsets.only(top: 55.h),
                  child: Column(
                    children: [
                      SizedBox(height: 16.h),
                      const HeaderLogo(),
                      SizedBox(height: 50.h),
                      OtpForm(),
                      SizedBox(height: 25.h),
                      Obx(() {
                        return controller.loading.isTrue
                            ? const Center(child: CircularProgressIndicator())
                            : Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: AppElevatedButton(
                            backgroundColor: ColorResource.mainColor,
                            onPressed: (){
                              controller.performVerify();
                            },
                            title: 'تحقق',
                            heightButton: 50.h,
                            widthButton: MediaQuery.of(context).size.width-30,
                            titleColor: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            radius: 8,
                          ),
                        );
                      }),

                      Obx(() {
                        return controller.reSendLoading.isTrue
                            ? const Center(child: CircularProgressIndicator())
                            : Padding(
                          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 24.h),
                          child: Column(
                            children: [
                              TextButtonApp(
                                onPressed: () {
                                  controller.performReSend();
                                },
                                title: 'اعادة الارسال',
                                color: ColorResource.mainColor,
                                alignment: Alignment.center,
                              ),
                              SizedBox(
                                height: 32.h,
                              ),
                            ],
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
                    title:'لقد أرسلنا إليك رسالة نصية قصيرة تحتوي على رمز التحقق إلى بريدك الاكتروني ' ,
                    onTitle: 'Mona _Fadl1233@gmail.com',
                    onPressed: () {},
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    height: 32.h,
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
