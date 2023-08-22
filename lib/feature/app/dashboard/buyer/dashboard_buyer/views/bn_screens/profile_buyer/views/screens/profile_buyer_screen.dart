library profile_buyer_view;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haraj/feature/app/dashboard/buyer/dashboard_buyer/views/bn_screens/profile_buyer/controllers/profile_buyer_controller.dart';

// part '../components/app_bottom_sheet.dart';
// part '../screens/view_all_deal_screen.dart';

class ProfileBuyerScreen extends GetView<ProfileBuyerController> {
  final ProfileBuyerController profileBuyerController =
      Get.put(ProfileBuyerController());

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
              ]),
        ),
      ),
    );
  }
}
