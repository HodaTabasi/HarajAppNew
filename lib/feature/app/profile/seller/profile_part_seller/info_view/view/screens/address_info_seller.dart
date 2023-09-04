
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haraj/utils/extensions/color_resource/color_resource.dart';
import 'package:haraj/utils/extensions/icons_app/icons_app.dart';

import '../components/image_profile.dart';
import '../components/info_appbar_widget.dart';
import '../components/info_item_widget.dart';


class AddressInfoSellerScreen extends StatefulWidget {
  const AddressInfoSellerScreen({Key? key}) : super(key: key);

  @override
  State<AddressInfoSellerScreen> createState() =>
      _AddressInfoSellerScreenState();
}

class _AddressInfoSellerScreenState extends State<AddressInfoSellerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResource.backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 120.h),
        child: InfoAppBarWidget(text: 'بيانات العنوان'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20.r),
        children: [
          const ImageProfile(),
          SizedBox(height: 20.h),
          InfoItemWidget(
            title: 'المنطقة',
            text: 'محمد احمد',
            icon: IconsApp.person,
          ),
          InfoItemWidget(
            title: 'المدينة',
            text: 'الرياض ',
            icon: IconsApp.mobile,
          ),
          InfoItemWidget(
            title: 'الموقع',
            text: 'sdefh142',
            icon: IconsApp.vendorAccount,
          ),
          InfoItemWidget(
            title: 'اسم الشارع',
            text: 'Mona Fadl@gmail.com',
            icon: IconsApp.email,
          ),
          InfoItemWidget(
            title: 'رقم المبني',
            text: '9966885566',
            icon: IconsApp.id,
          ),
          InfoItemWidget(
            title: 'رقم الرمز البريدي',
            text: '9966885566',
            icon: IconsApp.id,
          ),
        ],
      ),
    );
  }
}

