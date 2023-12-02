import 'package:expandable/expandable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:haraj/feature/app/setting/controller/setting_getx_controller.dart';
import 'package:haraj/feature/core/launch_screen.dart';
import 'package:haraj/utils/extensions/main_extension/context_extension.dart';
import 'package:haraj/utils/prefs/shared_pref_controller.dart';
import 'package:haraj/widgets/app_divider.dart';
import 'package:haraj/widgets/app_elevated_button.dart';
import 'package:haraj/widgets/app_switch_button.dart';
import 'package:haraj/widgets/app_text.dart';

import '../../../../../utils/extensions/color_resource/color_resource.dart';
import '../../../../../utils/extensions/icons_app/icons_app.dart';
import '../../../../../utils/get/general_getx_controller.dart';
import '../../../../../utils/get/localizations/language_getx_controller.dart';
import '../../../../../widgets/custom_textformfiled.dart';


class SettingScreen extends GetView<SettingGetXController> {
  late Rx<Locale> locale;

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      // backgroundColor: ,
      appBar: AppBar(),
      body: ListView(
        padding: EdgeInsets.all(8.r),
        children: [
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: 12.w, vertical: 16.h),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: ColorResource.borderGray, width: 0.5.w),
                color: Colors.white),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(text: 'معلومات الحساب',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w300,
                  color: ColorResource.lightGreyText3,),
                ExpandableNotifier(
                  child: ScrollOnExpand(
                    scrollOnExpand: true,
                    scrollOnCollapse: false,
                    child: ExpandablePanel(
                      theme: const ExpandableThemeData(
                        headerAlignment:
                        ExpandablePanelHeaderAlignment.center,
                        tapBodyToCollapse: true,
                      ),
                      header: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 10.h),
                          child: Row(
                            children: [
                              AppText(
                                text: 'البريد الالكتروني',
                                fontSize: 14.sp,
                              ),
                              const Spacer(),
                              AppText(
                                text:SharedPrefController().email,
                                fontWeight: FontWeight.w300,
                                fontSize: 14.sp,
                                color: ColorResource.mainColor,
                              ),
                            ],
                          )),
                      collapsed:const AppDivider(height: 1,color: ColorResource.dividerVirticalColor,thickness: 0.5),
                      expanded: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: <Widget>[
                            const AppDivider(height: 1,color: ColorResource.dividerVirticalColor,thickness: 0.5),
                            SizedBox(
                              height: 16.h,
                            ),
                            AppTextFomField(
                              focusNode: FocusNode(),
                              textController: controller.emailController,
                              textInputType: TextInputType.emailAddress,
                              title: context.localizations.email,
                              radius: 6.r,
                              prefixIcon: IconsApp.email,
                              // validator: GeneralGetxController.to.emailValidation,
                              errorTitle: GeneralGetxController.to.emailErrorText.value,
                              type: 'email',
                            ),
                            // AppText(
                            //   text: 'سوف نرسل الى رقمك رسالة نصية تحتوي كود تحقيق عليك أدخالها حتى تتمكن من تغيير رقمك',
                            //   fontSize: 14.sp,
                            //   fontWeight: FontWeight.w300,
                            // ),
                            SizedBox(
                              height: 24.h,
                            ),
                            Obx(() {
                              return controller.loading.isTrue
                                  ? const Center(child: CircularProgressIndicator())
                                  : Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20.w),
                                child: AppElevatedButton(
                                  backgroundColor: ColorResource.red,
                                  onPressed: (){
                                    controller.updateEmail();
                                  },
                                  title: 'ارسال',
                                  heightButton: 50.h,
                                  widthButton: MediaQuery.of(context).size.width-30,
                                  titleColor: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  radius: 8,
                                ),
                              );
                            }),

                            SizedBox(
                              height: 24.h,
                            ),
                            const AppDivider(height: 1, color: ColorResource.dividerVirticalColor, thickness: 0.5),
                          ],
                        ),
                      ),
                      builder: (_, collapsed, expanded) {
                        return Padding(
                          padding: EdgeInsets.only(
                              left: 10.w,
                              right: 10.w,
                              bottom: 10.h),
                          child: Expandable(
                            collapsed: collapsed,
                            expanded: expanded,
                            theme: const ExpandableThemeData(
                                crossFadePoint: 0),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                ExpandableNotifier(
                  child: ScrollOnExpand(
                    scrollOnExpand: true,
                    scrollOnCollapse: false,
                    child: ExpandablePanel(
                      theme: const ExpandableThemeData(
                        headerAlignment:
                        ExpandablePanelHeaderAlignment.center,
                        tapBodyToCollapse: true,
                      ),
                      header: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 10.h),
                          child: Row(
                            children: [
                              AppText(
                                text: ' تغيير اللغة',
                                fontSize: 14.sp,
                              ),
                              const Spacer(),
                              AppText(
                                text: Get.locale?.toLanguageTag() == "ar"?"العربية":"English",
                                fontWeight: FontWeight.w300,
                                fontSize: 14.sp,
                                color: ColorResource.mainColor,
                              ),
                            ],
                          )),
                      collapsed: Padding(
                        padding:
                        EdgeInsets.symmetric(vertical: 10.h),
                        child: const AppDivider(height: 1, color: ColorResource.dividerVirticalColor, thickness: 0.5),
                      ),
                      expanded: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: <Widget>[
                            const AppDivider(height: 1, color: ColorResource.dividerVirticalColor, thickness: 0.5),
                            SizedBox(
                              height: 16.h,
                            ),
                            Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Get.locale?.toLanguageTag() == "ar"?ColorResource.mainColor:Colors.white,
                                    borderRadius:
                                    BorderRadius.circular(
                                        12.r),
                                    border: Border.all(
                                        color: ColorResource.containerColor),
                                  ),

                                  padding: EdgeInsets.symmetric(
                                    horizontal: 16.w,
                                    vertical: 12.h,
                                  ),
                                  child:  InkWell(
                                    onTap: (){
                                      locale =  const Locale("ar").obs;
                                      Get.updateLocale(locale.value);                                      },
                                    child:  AppText(
                                      text: 'العربية',
                                      color: Get.locale?.toLanguageTag() == "ar"?Colors.white:ColorResource.borderGray,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 14.w,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Get.locale?.toLanguageTag() == "en"?ColorResource.mainColor:Colors.white,
                                    borderRadius:
                                    BorderRadius.circular(
                                        12.r),
                                    border: Border.all(
                                        color: ColorResource.containerColor),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 16.w,
                                    vertical: 12.h,
                                  ),
                                  child: InkWell(
                                    onTap: (){
                                     locale =  const Locale("en").obs;
                                      Get.updateLocale(locale.value);
                                      },
                                    child:  AppText(
                                      text: 'English',
                                      color: Get.locale?.toLanguageTag() == "en"?Colors.white:ColorResource.borderGray,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 24.h,
                            ),
                            const AppDivider(height: 1, color: ColorResource.dividerVirticalColor, thickness: 0.5),
                          ],
                        ),
                      ),
                      builder: (_, collapsed, expanded) {
                        return Padding(
                          padding: EdgeInsets.only(
                            left: 10.w,
                            right: 10.w,
                            bottom: 10.h,
                          ),
                          child: Expandable(
                            collapsed: collapsed,
                            expanded: expanded,
                            theme: const ExpandableThemeData(
                                crossFadePoint: 0),
                          ),
                        );
                      },
                    ),
                  ),
                ),

                ExpandableNotifier(
                  child: ScrollOnExpand(
                    scrollOnExpand: true,
                    scrollOnCollapse: false,
                    child: ExpandablePanel(
                      theme: const ExpandableThemeData(
                        headerAlignment:
                        ExpandablePanelHeaderAlignment.center,
                        tapBodyToCollapse: true,
                      ),
                      header: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 10.h),
                          child: Row(
                            children: [
                              AppText(
                                text: 'تغيير كلمة المرور',
                                fontSize: 14.sp,
                              ),
                              const Spacer(),
                              AppText(
                                text: '***********',
                                fontWeight: FontWeight.w300,
                                fontSize: 14.sp,
                                color: ColorResource.mainColor,
                              ),
                            ],
                          )),
                      collapsed: Padding(
                        padding:
                        EdgeInsets.symmetric(vertical: 10.h),
                        child: const AppDivider(height: 1, color: ColorResource.dividerVirticalColor, thickness: 0.5),
                      ),
                      expanded: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: <Widget>[
                        const AppDivider(height: 1, color: ColorResource.dividerVirticalColor, thickness: 0.5),
                            SizedBox(
                              height: 16.h,
                            ),
                            AppText(
                              text: 'كلمة المرور القديمة',
                              fontWeight: FontWeight.w300,
                              fontSize: 12.sp,
                            ),
                            AppTextFomField(
                              focusNode: FocusNode(),
                              textController: controller.passwordController,
                              textInputType: TextInputType.visiblePassword,
                              title: context.localizations.password,
                              radius: 6.r,
                              prefixIcon: IconsApp.password,
                              secure:
                              controller.isVisibility.value, // Toggle the secure property
                              suffixIcon: IconButton(
                                color: ColorResource.red,
                                onPressed: () {
                                  controller
                                      .toggleVisibility(); // Call the toggleVisibility method
                                  debugPrint('${controller.isVisibility.value}');
                                },
                                icon: Icon(
                                  controller.isVisibility
                                      .value // Use .value to get the RxBool value
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: controller.isVisibility
                                      .value // Use .value to get the RxBool value
                                      ? ColorResource.gray
                                      : ColorResource.black,
                                ),
                              ),
                              // validator: GeneralGetxController.to.passwordValidation,
                              errorTitle: GeneralGetxController.to.passwordErrorText.value,
                              type: 'password',
                            ),
                            AppText(
                              text: 'كلمة المرور الجديدة',
                              fontWeight: FontWeight.w300,
                              fontSize: 12.sp,
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            AppTextFomField(
                              focusNode: FocusNode(),
                              textController: controller.newPasswordController,
                              textInputType: TextInputType.visiblePassword,
                              title: context.localizations.password,
                              radius: 6.r,
                              prefixIcon: IconsApp.password,
                              secure:
                              controller.isVisibility.value, // Toggle the secure property
                              suffixIcon: IconButton(
                                color: ColorResource.red,
                                onPressed: () {
                                  controller
                                      .toggleVisibility(); // Call the toggleVisibility method
                                  debugPrint('${controller.isVisibility.value}');
                                },
                                icon: Icon(
                                  controller.isVisibility
                                      .value // Use .value to get the RxBool value
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: controller.isVisibility
                                      .value // Use .value to get the RxBool value
                                      ? ColorResource.gray
                                      : ColorResource.black,
                                ),
                              ),
                              // validator: GeneralGetxController.to.passwordValidation,
                              errorTitle: GeneralGetxController.to.confiormPasswordErrorText.value,
                              type: 'password',
                            ),
                            AppText(
                              text: 'تاكيد كلمة المرور',
                              fontWeight: FontWeight.w300,
                              fontSize: 12.sp,
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            AppTextFomField(
                              focusNode: FocusNode(),
                              textController: controller.rePasswordController,
                              textInputType: TextInputType.visiblePassword,
                              title: context.localizations.password,
                              radius: 6.r,
                              prefixIcon: IconsApp.password,
                              secure:
                              controller.isVisibility.value, // Toggle the secure property
                              suffixIcon: IconButton(
                                color: ColorResource.red,
                                onPressed: () {
                                  controller
                                      .toggleVisibility(); // Call the toggleVisibility method
                                  debugPrint('${controller.isVisibility.value}');
                                },
                                icon: Icon(
                                  controller.isVisibility
                                      .value // Use .value to get the RxBool value
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: controller.isVisibility
                                      .value // Use .value to get the RxBool value
                                      ? ColorResource.gray
                                      : ColorResource.black,
                                ),
                              ),
                              // validator: GeneralGetxController.to.passwordValidation,
                              errorTitle: GeneralGetxController.to.confiormPasswordErrorText.value,
                              type: 'conformPassword',
                            ),
                            SizedBox(
                              height: 24.h,
                            ),

                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.end,
                              children: [
                                TextButton(
                                    onPressed: () {
                                    },
                                    child: AppText(
                                      text: 'نسيت كلمة المرور',
                                      color: ColorResource.mainColor,
                                    )),
                              ],
                            ),
                            SizedBox(
                              height: 24.h,
                            ),
                            AppElevatedButton(
                              backgroundColor: ColorResource.red,
                              onPressed: (){},
                              title: 'تغيير',
                              heightButton: 50.h,
                              widthButton: MediaQuery.of(context).size.width-30,
                              titleColor: Colors.white,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              radius: 8,
                            ),
                            SizedBox(
                              height: 24.h,
                            ),
                            const AppDivider(height: 1, color: ColorResource.dividerVirticalColor, thickness: 0.5),

                          ],
                        ),
                      ),
                      builder: (_, collapsed, expanded) {
                        return Padding(
                          padding: EdgeInsets.only(
                            left: 10.w,
                            right: 10.w,
                            bottom: 10.h,
                          ),
                          child: Expandable(
                            collapsed: collapsed,
                            expanded: expanded,
                            theme: const ExpandableThemeData(
                                crossFadePoint: 0),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 24.h,
          ),
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: 12.w, vertical: 16.h),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: ColorResource.borderGray, width: 0.5.w),
                color: Colors.white),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AppText(text: 'المزيد',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w300,
                  color: ColorResource.lightGreyText3,),
                SizedBox(
                  height: 12.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(text: 'أيقاف الاشعارات',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w300,
                      color: ColorResource.lightGreyText3,),
                    AppSwitchButton()
                  ],
                ),
                 AppDivider(height: 15.h, color: ColorResource.dividerVirticalColor, thickness: 0.5),
               SizedBox(height: 12.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(text: 'الوضع الداكن',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w300,
                      color: ColorResource.lightGreyText3,),
                    AppSwitchButton()
                  ],
                ),
                AppDivider(height: 15.h, color: ColorResource.dividerVirticalColor, thickness: 0.5),
                SizedBox(height: 12.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(
                      text:'نرقيه التطبيق',
                      color: ColorResource.borderGray,
                      fontSize: 14.sp,
                    ),
                    AppText(
                      text: 'انت تمتلك احدث اصدار 1.1.1',
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w300,
                      color: const Color(0x66AB1216),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
