import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:haraj/utils/extensions/color_resource/color_resource.dart';
import 'package:haraj/utils/extensions/icons_app/icons_app.dart';

import '../../../../controllers/profile_seller_controller.dart';
import '../components/image_profile.dart';
import '../components/info_appbar_widget.dart';
import '../components/info_item_widget.dart';

class PersonalInfoSellerScreen extends StatefulWidget {
  const PersonalInfoSellerScreen({Key? key}) : super(key: key);

  @override
  State<PersonalInfoSellerScreen> createState() =>
      _PersonalInfoSellerScreenState();
}

class _PersonalInfoSellerScreenState extends State<PersonalInfoSellerScreen> {
  ProfileSellerController profileSellerController =
      Get.find<ProfileSellerController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResource.backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 120.h),
        child: const InfoAppBarWidget(text: 'البيانات الشخصية'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20.r),
        children: [
           ImageProfile(avatar:profileSellerController.userModel?.data!.avatar),
          SizedBox(height: 20.h),
          InfoItemWidget(
            title: 'الاسم الحقيقي',
            text: '${profileSellerController.userModel?.data!.name}',
            icon: IconsApp.person,
          ),
          InfoItemWidget(
            title: 'رقم الهاتف الرسمي ',
            text: '${profileSellerController.userModel?.data!.mobile}',
            icon: IconsApp.mobile,
          ),
          InfoItemWidget(
            title: 'البريد الالكتروني',
            text: '${profileSellerController.userModel?.data!.email}',
            icon: IconsApp.email,
          ),
          InfoItemWidget(
            title: 'رقم الهوية',
            text: '${profileSellerController.userModel?.data!.ssn}',
            icon: IconsApp.id,
          ),
        ],
      ),
    );
  }
}
