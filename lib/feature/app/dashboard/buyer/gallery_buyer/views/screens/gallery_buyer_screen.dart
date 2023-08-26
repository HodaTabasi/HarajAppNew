library gallery_buyer_view;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:haraj/feature/app/dashboard/buyer/ads_detail_buyer/views/screens/ads_detail_buyer_screen.dart';
import 'package:haraj/feature/app/dashboard/buyer/gallery_buyer/controllers/gallery_buyer_controller.dart';
import 'package:haraj/utils/extensions/color_resource/color_resource.dart';
import 'package:haraj/utils/extensions/icons_app/icons_app.dart';
import 'package:haraj/utils/extensions/images_app/images_app.dart';
import 'package:haraj/utils/extensions/main_extension/context_extension.dart';
import 'package:haraj/widgets/app_ads_car_container.dart';
import 'package:haraj/widgets/app_body_container.dart';
import 'package:haraj/widgets/app_image.dart';
import 'package:haraj/widgets/app_svg_picture.dart';
import 'package:haraj/widgets/app_tab_bar.dart';
import 'package:haraj/widgets/app_text.dart';
import 'package:haraj/widgets/custom_appbar.dart';
import 'package:haraj/widgets/row_divider_widget.dart';

part '../components/about_gallery_component.dart';
part '../components/ads_gallery_component.dart';
part '../components/header_image.dart';
part '../components/images_gallery_component.dart';
part '../screens/map_screen.dart';

class GalleryBuyerScreen extends GetView<GalleryBuyerController> {
  final GalleryBuyerController galleryBuyerController =
      Get.put(GalleryBuyerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: CustomAppBar(
        title: context.localizations.page,
        heightBackground: 100.h,
        showLeading: true,
        showSearch: false,
        showActions: false,
      ),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TabBarComponent(
                tabTitles: [
                  //TODO:Make Lang Here
                  "حول المعرض",
                  context.localizations.exhibition_images,
                  context.localizations.ads,
                ],
                tabViews: const [
                  AboutGalleryComponent(),
                  ImagesGalleryComponent(),
                  AdsGalleryComponent(),
                  // Other tab views
                ],
                height: 630.h,
              ),
            ]),
      ),
    );
  }
}
