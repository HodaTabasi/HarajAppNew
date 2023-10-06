

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:haraj/utils/extensions/main_extension/context_extension.dart';

import '../../../../../utils/extensions/color_resource/color_resource.dart';
import '../../../../../utils/extensions/icons_app/icons_app.dart';
import '../../../../../widgets/app_divider.dart';
import '../../../../../widgets/app_svg_picture.dart';
import '../../../../../widgets/app_text.dart';
import '../../controller/setting_getx_controller.dart';
import '../../../dashboard/seller/dashboard_seller/views/bn_screens/add_ads_seller/views/screens/add_seller_screen.dart';

class BottomSheetBodyDelete extends StatelessWidget {

  SettingGetXController settingGetXController = Get.find<SettingGetXController>();


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16.0.r,vertical: 16.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.topLeft,
            child: CircleAvatar(
              radius: 15.r,
              backgroundColor: ColorResource.lightGray,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.close_rounded,
                  size: 14.w,
                  color: ColorResource.mainColor,
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: CircleAvatar(
              radius: 50.r,
              backgroundColor: ColorResource.lightGray,
              child: AppSvgPicture(
                assetName: IconsApp.character,
              ),
            ),
          ),
          SizedBox(height: 18.h),
          AppText(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            text: context.localizations.delete_account_msg,
            color: ColorResource.mainFontColor,
          ),
          AppDivider(
            color: ColorResource.secondaryColor,
            height: 41.h,
            thickness: 1.h,
          ),
          const Spacer(),
          Row(
            children: [
              Expanded(
                child: Obx(() {
                  return settingGetXController.loading.isTrue
                      ? const Center(child: CircularProgressIndicator())
                      : Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child:     DoneButton(
                      title: context.localizations.yess,
                      onPressed: () {
                        settingGetXController.deleteAccount();
                      },
                    ),
                  );
                }),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: DoneButton(
                  title: context.localizations.noo,
                  onPressed: () {
                    Get.back();

                  },
                ),
              ),


            ],
          ),
        ],
      ),
    );
  }
}
