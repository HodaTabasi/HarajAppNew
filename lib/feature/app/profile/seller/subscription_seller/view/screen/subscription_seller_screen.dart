library subscription_seller_view;

import 'dart:ui';

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:haraj/feature/app/dashboard/seller/dashboard_seller/views/dashboard_screen.dart';
import 'package:haraj/feature/app/profile/seller/subscription_seller/controller/subscription_seller_controller.dart';
import 'package:haraj/utils/extensions/color_resource/color_resource.dart';
import 'package:haraj/utils/extensions/icons_app/icons_app.dart';
import 'package:haraj/utils/extensions/images_app/images_app.dart';
import 'package:haraj/utils/extensions/main_extension/context_extension.dart';
import 'package:haraj/widgets/app_elevated_button.dart';
import 'package:haraj/widgets/app_image.dart';
import 'package:haraj/widgets/app_svg_picture.dart';
import 'package:haraj/widgets/app_text.dart';
import 'package:haraj/widgets/custom_appbar.dart';
import 'package:haraj/widgets/row_divider_widget.dart';

part '../components/error_dialog.dart';
part '../components/header_image.dart';
part '../components/main_container.dart';
part '../components/save_button.dart';
part '../components/swiper_component.dart';
part '../screen/map_screen.dart';

class SubscriptionSellerScreen extends GetView<SubscriptionSellerController> {
  SubscriptionSellerController subscriptionSellerController =
      Get.put(SubscriptionSellerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: context.localizations.subscription_data,
        showSearch: false,
        showLeading: false,
        imageHeight: 100.h,
      ),
      body: Column(
        children: [
          MainContainer(),
        ],
      ),
    );
  }
}
