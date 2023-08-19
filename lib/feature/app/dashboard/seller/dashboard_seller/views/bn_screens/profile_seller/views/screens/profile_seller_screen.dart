library profile_seller_view;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haraj/feature/app/dashboard/seller/dashboard_seller/views/bn_screens/profile_seller/controllers/profile_seller_controller.dart';

// part '../components/app_bottom_sheet.dart';
// part '../screens/view_all_deal_screen.dart';

class ProfileSellerScreen extends GetView<ProfileSellerController> {
  final ProfileSellerController profileSellerController =
      Get.put(ProfileSellerController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(child: Text('Profile Screen')),

                // const HeaderImage(),
                // SizedBox(height: 14.h),
                // const HomeInputField(),
                // SizedBox(height: 11.h),
                // const CategoriesText(),
                // SizedBox(height: 11.h),
                // CategoriesComponent(),
                // SizedBox(height: 15.h),
                // const DealText(),
                // SizedBox(height: 11.h),
                // DealsComponent(),
                // SizedBox(height: 15.h),
                // const NearByStoreText(),
                // SizedBox(height: 11.h),
                // NearByStoreComponent(),
              ]),
        ),
      ),
    );
  }
}
