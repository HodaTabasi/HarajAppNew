library complete_buyer_profile_view;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haraj/feature/app/profile/complete_buyer_profile/controller/complete_profile_buyer_screen.dart';

class CompleteProfileBuyerScreen
    extends GetView<CompleteProfileBuyerController> {
  CompleteProfileBuyerController completeProfileBuyerController =
      Get.put(CompleteProfileBuyerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
