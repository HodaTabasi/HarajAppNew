import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:haraj/feature/app/setting/controller/setting_getx_controller.dart';
import 'package:haraj/utils/extensions/color_resource/color_resource.dart';
import 'package:haraj/utils/extensions/icons_app/icons_app.dart';
import 'package:haraj/utils/extensions/main_extension/context_extension.dart';
import 'package:haraj/widgets/app_divider.dart';
import 'package:haraj/widgets/app_svg_picture.dart';
import 'package:haraj/widgets/app_text.dart';

class ContactUs extends GetView<SettingGetXController> {


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
          color: const Color(0xffFEFEFE),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r), topRight: Radius.circular(20.r))),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: AlignmentDirectional.topEnd,
              child: InkWell(
                onTap: () {
                  Get.back();
                },
                child: const Icon(
                  Icons.clear,
                  color: ColorResource.red,
                ),
              ),
            ),
            AppText(
              text: 'تواصل معنا',
              color: ColorResource.black,
              fontSize: 16.sp,
            ),
            SizedBox(
              height: 16.h,
            ),
            const AppDivider(
                height: 1, color: ColorResource.lightGreyDivider, thickness: 1),
            SizedBox(
              height: 40.h,
            ),
            AppText(
              text: '''
            يمكنك التواصل مع الدعم الفني وتقديم الشكاوى 
            والمقترحات من خلال حساباتنا على السوشل ميديا''',
              color: ColorResource.black,
              fontSize: 14.sp,
            ),
            SizedBox(
              height: 40.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                    onTap: () {
                      context.launchTUrl(Uri.parse(controller.settingModel?.twitter??''));
                    },
                    child: AppSvgPicture(assetName: IconsApp.cTwitter)),
                InkWell(
                    onTap: () {
                      context.launchFaceBookUrl(Uri.parse(controller.settingModel?.facebook??''));
                    },
                    child: AppSvgPicture(assetName: IconsApp.cFaceBook)),
                InkWell(
                    onTap: () {
                      context.launchTUrl(Uri.parse(controller.settingModel?.instagram??''));
                    },
                    child: AppSvgPicture(assetName: IconsApp.cInatagram)),
                InkWell(
                    onTap: () {
                      context.launchTUrl(Uri.parse(controller.settingModel?.whatsapp??''));
                    },
                    child: AppSvgPicture(assetName: IconsApp.cWhatsApp)),
                InkWell(
                    onTap: () {
                      context.launchTUrl(Uri.parse(controller.settingModel?.telegram??''));
                    },
                    child: AppSvgPicture(assetName: IconsApp.cTelegram)),
              ],
            ),
            SizedBox(
              height: 34.h,
            ),
            AppText(
              text: '''
            يتم الرد على استفساراتكم عبر منصات التواصل
             الاجتماعي مواعيد العمل الرسمية بمعدل رد اقل من ساعة''',
              fontSize: 14.sp,
              color: ColorResource.secoundryFontColor,
            ),
            SizedBox(
              height: 30.h,
            ),
            Align(
                child: AppText(
              text: 'يمكنكم التواصل في اي وقت',
              color: ColorResource.mainColor,
              fontSize: 14.sp,
              textAlign: TextAlign.center,
            ))
          ],
        ),
      ),
    );
  }
}
