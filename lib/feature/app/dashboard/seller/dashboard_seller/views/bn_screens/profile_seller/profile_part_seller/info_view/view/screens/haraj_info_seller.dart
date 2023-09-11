
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haraj/utils/extensions/color_resource/color_resource.dart';
import 'package:haraj/utils/extensions/icons_app/icons_app.dart';

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
          ImageProfile(),
          SizedBox(height: 20.h),
          InfoItemWidget(
            title: 'اسم المعرض',
            text: 'محمد احمد',
            icon: IconsApp.person,
          ),
          InfoItemWidget(
            title: 'رقم هاتف المعرض',
            text: '+971 5211043',
            icon: IconsApp.mobile,
          ),
          InfoItemWidget(
            title: 'رقم السجل التجاري',
            text: 'sdefh142',
            icon: IconsApp.vendorAccount,
          ),
          InfoItemWidget(
            title: '  البريد الالكتروني الرسمي للمعرض',
            text: 'Mona Fadl@gmail.com',
            icon: IconsApp.email,
          ),
          InfoItemWidget(
            title: 'نبذه عن المعرض ',
            text: '9966885566',
            icon: IconsApp.id,
          ),
        ],
      ),
    );
  }
}

