import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:haraj/utils/extensions/main_extension/context_extension.dart';

import '../../../../../../../../../../utils/extensions/color_resource/color_resource.dart';
import '../../../../../../../../../../utils/extensions/icons_app/icons_app.dart';
import '../../../../../../../../../../widgets/app_body_container.dart';
import '../../../../../../../../../../widgets/app_bottom_sheet.dart';
import '../../../../../../../../../../widgets/app_divider.dart';
import '../../../../../../../../../../widgets/app_svg_picture.dart';
import '../../../../../../../../../../widgets/app_text.dart';
import '../../../../../../../../profile/complete_profile/profile_buyer/screen/complete_profile_buyer_screen.dart';
import '../../controllers/profile_seller_controller.dart';
import '../info_view/view/components/info_appbar_widget.dart';
import 'components/show_photo.dart';

class SellerGallaryPage extends GetView<ProfileSellerController> {
  ProfileSellerController profileSellerController =
      Get.put(ProfileSellerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResource.white,
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 120.h),
        child: const InfoAppBarWidget(text: 'صور المعرض'),
      ),
      body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(height: 24.h),
                AppBodyContainer(
                  verticalMargin: 0.h,
                  verticalPadding: 0.h,
                  horizontalPadding: 0.w,
                  body: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.only(start: 12.w, top: 12.h),
                        child: AppText(
                          text: context.localizations.add_car_images,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: ColorResource.mainFontColor,
                          textAlign: TextAlign.start,
                        ),
                      ),
                      AppDivider(
                        height: 24.h,
                        color: ColorResource.gray,
                        thickness: 1,
                      ),
                      ShowPhoto(),
                      Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: (){
                                controller.deleteImageFromGallery();
                              },
                              child: Container(
                                width: double.infinity.w,
                                height: 40.h,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color:
                                      ColorResource.mainColor.withOpacity(0.05),
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(14.r),
                                  ),
                                ),
                                child: AppSvgPicture(
                                  assetName: IconsApp.remove,
                                ),
                              ),
                            ),
                          ),
                          const VerticalDivider(
                            color: ColorResource.gray,
                            width: 1,
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                // controller.selectPhoto();
                                controller.selectImages();
                              },
                              child: Container(
                                width: double.infinity.w,
                                height: 40.h,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color:
                                      ColorResource.mainColor.withOpacity(0.05),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(14.r),
                                  ),
                                ),
                                child: Icon(
                                  Icons.add_rounded,
                                  size: 35.w,
                                  color: ColorResource.mainColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                AppDivider(
                  height: 37.h,
                  color: ColorResource.gray,
                  thickness: 1,
                ),
                SizedBox(height: 24.h),
            Obx(() {
                return controller.loading.isTrue
                    ? const Center(child: CircularProgressIndicator())
                    : Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child:  SaveButton(
                    //TODO: Make Lang Here
                    title: 'اضافة',
                    onPressed: () {
                      controller.addImageStore();
                    },
                  ),
                );
              }
            )

              ],
            ),
          ),
        )

    );
  }
}
