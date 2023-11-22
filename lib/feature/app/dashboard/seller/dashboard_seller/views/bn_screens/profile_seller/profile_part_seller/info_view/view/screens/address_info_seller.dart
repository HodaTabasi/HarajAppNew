import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:haraj/utils/extensions/color_resource/color_resource.dart';
import 'package:haraj/utils/extensions/icons_app/icons_app.dart';

import '../../../../controllers/profile_seller_controller.dart';
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
  ProfileSellerController profileSellerController =
      Get.find<ProfileSellerController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResource.backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 120.h),
        child: const InfoAppBarWidget(text: 'بيانات العنوان'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20.r),
        children: [
          // ImageProfile(avatar: profileSellerController.userModel?.data!.store?.avatar,),
          SizedBox(height: 20.h),
          InfoItemWidget(
            title: 'المنطقة',
            text:
                '${profileSellerController.userModel?.data!.store?.address?.governorate?.name}',
            icon: IconsApp.person,
          ),
          InfoItemWidget(
            title: 'المدينة',
            text: '${profileSellerController.userModel?.data!.store?.address?.city?.name}',
            icon: IconsApp.mobile,
          ),
          // InfoItemWidget(
          //   title: 'الموقع',
          //   text: 'sdefh142',
          //   icon: IconsApp.vendorAccount,
          // ),
          InfoItemWidget(
            title: 'اسم الشارع',
            text: '${profileSellerController.userModel?.data!.store?.address?.street}',
            icon: IconsApp.email,
          ),
          InfoItemWidget(
            title: 'رقم المبني',
            text: '${profileSellerController.userModel?.data!.store?.address?.buildingNo}',
            icon: IconsApp.id,
          ),
          InfoItemWidget(
            title: 'رقم الرمز البريدي',
            text: '${profileSellerController.userModel?.data!.store?.address?.postCode}',
            icon: IconsApp.id,
          ),
        ],
      ),
    );
  }
}
