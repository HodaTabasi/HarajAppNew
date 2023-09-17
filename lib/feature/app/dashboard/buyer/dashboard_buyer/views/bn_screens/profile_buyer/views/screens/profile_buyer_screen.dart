library public_profile_buyer_view;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:haraj/feature/app/dashboard/buyer/dashboard_buyer/views/bn_screens/profile_buyer/controllers/profile_buyer_controller.dart';
import 'package:haraj/feature/app/profile/complete_profile/controller/complete_profile_buyer_controller.dart';
import 'package:haraj/feature/app/profile/complete_profile/profile_buyer/screen/complete_profile_buyer_screen.dart';
import 'package:haraj/feature/app/setting/view/screens/statice_page.dart';
import 'package:haraj/utils/extensions/main_extension/context_extension.dart';

import '../../../../../../../../../../utils/extensions/color_resource/color_resource.dart';
import '../../../../../../../../../../utils/extensions/icons_app/icons_app.dart';
import '../../../../../../../../../../widgets/app_elevated_button_withImage.dart';
import '../../../../../../../../../../widgets/app_svg_picture.dart';
import '../../../../../../../../../../widgets/app_text.dart';
import '../../../../../../../../auth/login/view/screen/login_screen.dart';
import '../../../../../../../../setting/view/screens/contact_us.dart';
import '../../../../../../../../setting/view/screens/setting.dart';
import 'package:share_plus/share_plus.dart';
part '../components/header_image.dart';
part '../components/main_list_tile.dart';
part '../components/app_bar_widget.dart';
part '../components/header_user_info.dart';
part '../components/sliver_appbar_widget.dart';

class ProfileBuyerScreen extends  GetView<ProfileBuyerController> {
  ProfileBuyerController profileSellerController = Get.put(ProfileBuyerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        controller: controller.controller1,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBarWidget(opacity: controller.opacity.value),
          ];
        },
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 16.0.r),
          children: [
            MainListTile(
              image: IconsApp.addressIcon,
              text: 'العروض المقدمة',
              onPress: () {
                // Get.to(()=>const AddressInfoSellerScreen());
              },
            ),
            MainListTile(
              image: IconsApp.aboutUs,
              text: 'من نحن',
              onPress: () {
                Get.to(()=>StaticScreen());
              },
            ),
            MainListTile(
              image: IconsApp.contactUs,
              text: 'تواصل معنا',
              onPress: () {
                Get.bottomSheet(ContactUs(),
                    enterBottomSheetDuration:
                    const Duration(milliseconds: 500),
                    exitBottomSheetDuration:
                    const Duration(milliseconds: 400));
              },
            ),
            MainListTile(
              image: IconsApp.share,
              text: 'شارك مع الاصدقاء',
              onPress: () async {
                await Share.share(
                  context.getPackageNameFun().toString(),
                  subject: "subject",
                  // sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
                );
              },
            ),
            MainListTile(
              image: IconsApp.policy,
              text: 'سياسات الخصوصية',
              onPress: () {
                Get.to(()=>StaticScreen());
              },
            ),
            MainListTile(
              image: IconsApp.condations,
              text: 'الشروط والاحكام',
              onPress: () {
                Get.to(()=>StaticScreen());
              },
            ),
            MainListTile(
              image: IconsApp.setting,
              text: 'الاعدادات',
              onPress: () {
                Get.to(()=>SettingScreen());
              },
            ),
            AppElevatedButtonWithImage(
              title: 'تسجيل خروج',
              backgroundColor: ColorResource.red,
              fontSize: 14.sp,
              radius: 10.r,
              fontWeight: FontWeight.normal,
              onPressed: () {},
              titleColor: ColorResource.white,
              heightButton: 50.h,
              widthButton: MediaQuery.of(context).size.width / 50.w,
              assetName: IconsApp.logout,
            ),
            TextButtonApp(
              onPressed: () {},
              title: 'حذف الحساب',
              color: ColorResource.mainColor,
              alignment: Alignment.center,
            ),
          ],
        ),
      ),
    );
  }
}

