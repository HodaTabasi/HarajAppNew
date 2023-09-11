
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:haraj/utils/extensions/color_resource/color_resource.dart';
import 'package:haraj/utils/extensions/icons_app/icons_app.dart';

import '../../../../controllers/profile_seller_controller.dart';
import '../components/image_profile.dart';
import '../components/info_appbar_widget.dart';
import '../components/info_item_widget.dart';


class HarajInfoSellerScreen extends StatefulWidget {
  const HarajInfoSellerScreen({Key? key}) : super(key: key);

  @override
  State<HarajInfoSellerScreen> createState() =>
      _HarajInfoSellerScreenState();
}

class _HarajInfoSellerScreenState extends State<HarajInfoSellerScreen> {
  ProfileSellerController profileSellerController =
  Get.find<ProfileSellerController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResource.backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 120.h),
        child: InfoAppBarWidget(text: 'بيانات المعرض'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20.r),
        children: [
          ImageProfile(avatar: profileSellerController.userModel?.data!.store?.avatar,),
          SizedBox(height: 20.h),
          InfoItemWidget(
            title: 'اسم المعرض',
            text: '${profileSellerController.userModel?.data!.store?.name}',
            icon: IconsApp.person,
          ),
          InfoItemWidget(
            title: 'رقم هاتف المعرض',
            text: '${profileSellerController.userModel?.data!.store?.mobile}',
            icon: IconsApp.mobile,
          ),
          InfoItemWidget(
            title: 'رقم السجل التجاري',
            text: '${profileSellerController.userModel?.data!.store?.commercialRegister}',
            icon: IconsApp.vendorAccount,
          ),
          InfoItemWidget(
            title: '  البريد الالكتروني الرسمي للمعرض',
            text: '${profileSellerController.userModel?.data!.store?.mobile}',
            icon: IconsApp.email,
          ),
          InfoItemWidget(
            title: 'نبذه عن المعرض ',
            text: '${profileSellerController.userModel?.data!.store?.description}',
            icon: IconsApp.id,
          ),
        ],
      ),
    );
  }
}

