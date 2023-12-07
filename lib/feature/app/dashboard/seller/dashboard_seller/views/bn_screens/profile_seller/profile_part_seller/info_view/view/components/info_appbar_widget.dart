// part of seller_info_view;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:haraj/utils/extensions/main_extension/context_extension.dart';

import '../../../../../../../../../../../../utils/extensions/color_resource/color_resource.dart';
import '../../../../../../../../../../../../utils/extensions/icons_app/icons_app.dart';
import '../../../../../../../../../../../../widgets/app_svg_picture.dart';
import '../../../../../../../../../../../../widgets/app_text.dart';
import '../../../../../../../../../../profile/complete_profile/controller/complete_profile_seller_controller.dart';
import '../../../../../../../../../../profile/complete_profile/profile_seller/screen/complete_profile_seller_screen.dart';
import '../../../../../../../../../../profile/seller/add_address_seller/controller/add_address_seller_controller.dart';
import '../../../../../../../../../../profile/seller/add_address_seller/view/screen/add_address_seller_screen.dart';
import '../../../../../../../../../../profile/seller/complete_store_seller/controller/complete_store_seller_controller.dart';
import '../../../../../../../../../../profile/seller/complete_store_seller/view/screen/complete_store_seller_screen.dart';
import '../../../../controllers/profile_seller_controller.dart';


class InfoAppBarWidget extends StatelessWidget {
  final String text;
  const InfoAppBarWidget({
    super.key,
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PositionedDirectional(
            start: 0,
            top: 0,
            end: 0,
            child: AppSvgPicture(
              assetName: IconsApp.tabBar,
              height: 110.h,
            )),
        PositionedDirectional(
          top: 2,
          start: 0,
          end: 0,
          child: AppBar(
              backgroundColor: Colors.transparent,
              centerTitle: true,
              title: AppText(text: text, fontSize: 18.sp),
              leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(Icons.arrow_back_ios,
                    color: ColorResource.black, size: 18.r),
              ),
              actions: [
                InkWell(
                    onTap: () {
                      if(text == 'البيانات الشخصية'){
                        CompleteProfileSellerController.to.putDataToTextField(user: ProfileSellerController.to.userModel?.data);
                        Get.to(()=>CompleteProfileSellerScreen());
                      }else if(text == 'بيانات العنوان'){
                        AddAddressSellerController.to.putDataToTextField(user: ProfileSellerController.to.userModel?.data);
                        Get.to(()=>AddAddressSellerScreen());
                      }else if(text == 'بيانات المعرض'){
                        CompleteStoreSellerController.to.putDataToTextField(user: ProfileSellerController.to.userModel?.data);
                        Get.to(()=>CompleteStoreSellerScreen());
                      }

                    },
                    child: Opacity(
                      opacity: (text == 'صور المعرض' || text == context.localizations.payment_lbl ) ?0:1,
                      child: AppSvgPicture(
                        assetName: IconsApp.editIcon,
                        width: 30.r,
                      ),
                    ))
              ]),
        )
      ],
    );
  }
}
