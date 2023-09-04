library public_profile_seller_view;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../utils/extensions/color_resource/color_resource.dart';
import '../../../../../../../utils/extensions/icons_app/icons_app.dart';
import '../../../../../../../widgets/app_elevated_button_withImage.dart';
import '../../../../../../../widgets/app_svg_picture.dart';
import '../../../../../../../widgets/app_text.dart';
import '../../../../../auth/login/view/screen/login_screen.dart';

part '../components/header_image.dart';
part '../components/main_list_tile.dart';
part '../components/app_bar_widget.dart';
part '../components/header_user_info.dart';
part '../components/sliver_appbar_widget.dart';

class ProfileSellerScreen extends StatefulWidget {
  const ProfileSellerScreen({Key? key}) : super(key: key);

  @override
  State<ProfileSellerScreen> createState() => _ProfileSellerScreenState();
}

class _ProfileSellerScreenState extends State<ProfileSellerScreen> {
  double opacity = 0.0;
  late ScrollController controller;

  @override
  void initState() {
    controller = ScrollController();
    controller.addListener(_listener);
    super.initState();
  }

  void _listener() {
    setState(() {
      opacity = controller.position.pixels/controller.position.maxScrollExtent;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        controller: controller,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBarWidget(opacity: opacity),
          ];
        },
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 16.0.r),
          children: [
            MainListTile(
              image: IconsApp.addressIcon,
              text: 'عنواني',
              onPress: () {

              },
            ),
            MainListTile(
              image: IconsApp.profileImages,
              text: 'صور المعرض',
              onPress: () {},
            ),
            MainListTile(
              image: IconsApp.vendorAccount,
              text: 'بيانات المعرض',
              onPress: () {},
            ),
            MainListTile(
              image: IconsApp.aboutUs,
              text: 'من نحن',
              onPress: () {},
            ),
            MainListTile(
              image: IconsApp.aboutApp,
              text: 'حول التطبيق',
              onPress: () {},
            ),
            MainListTile(
              image: IconsApp.contactUs,
              text: 'تواصل معنا',
              onPress: () {},
            ),
            MainListTile(
              image: IconsApp.share,
              text: 'شارك مع الاصدقاء',
              onPress: () {},
            ),
            MainListTile(
              image: IconsApp.policy,
              text: 'سياسات الخصوصية',
              onPress: () {},
            ),
            MainListTile(
              image: IconsApp.condations,
              text: 'الشروط والاحكام',
              onPress: () {},
            ),
            MainListTile(
              image: IconsApp.setting,
              text: 'الاعدادات',
              onPress: () {},
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

