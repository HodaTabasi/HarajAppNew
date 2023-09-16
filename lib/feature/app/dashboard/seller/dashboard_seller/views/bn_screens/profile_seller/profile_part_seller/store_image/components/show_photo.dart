import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:haraj/feature/app/dashboard/seller/dashboard_seller/views/bn_screens/profile_seller/controllers/profile_seller_controller.dart';
import 'package:haraj/utils/extensions/main_extension/context_extension.dart';

import '../../../../../../../../../../../utils/extensions/color_resource/color_resource.dart';
import '../../../../../../../../../../../utils/extensions/icons_app/icons_app.dart';
import '../../../../../../../../../../../widgets/app_svg_picture.dart';
import '../../../../../../../../../../../widgets/app_text.dart';

class ShowPhoto extends StatefulWidget {
  const ShowPhoto({Key? key}) : super(key: key);

  @override
  State<ShowPhoto> createState() => _ShowPhotoState();
}

class _ShowPhotoState extends State<ShowPhoto> {
  // ProfileSellerController controller =
  // Get.put(ProfileSellerController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileSellerController>(
      builder: (controller) {
        return controller.imageGalaryList!.isNotEmpty
            ? GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding:
          EdgeInsetsDirectional.symmetric(horizontal: 12.w, vertical: 4),
          itemCount: controller.imageGalaryList!.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 16.h, // Add spacing between grid items.
            crossAxisSpacing: 12.w, // Add spacing between grid items.
          ),
          itemBuilder: (BuildContext context, int index) {
            return Stack(
              children: [
                Container(
                  alignment: Alignment.center,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                      color: ColorResource.white,
                      borderRadius: BorderRadius.circular(4.r),
                      border: Border.all(
                        color: ColorResource.lightGray,
                      )),
                  child: controller.imageGalaryList![index].fromFile ??false ?Image.file(
                    File(controller.imageGalaryList![index].image!),
                    fit: BoxFit.cover,
                  ):Image.network(controller.imageGalaryList![index].image!),
                ),
                PositionedDirectional(
                  top: 10.h,
                  start: 0.w,
                  child: Checkbox(
                    value: controller.imageGalaryList![index].isSelected,
                    onChanged: (value) {
                      controller.updateSelected(index,value??false);
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.r),
                        side:  MaterialStateBorderSide.resolveWith(
                              (states) => const BorderSide(width: 1.0, color: Colors.red),
                        )
                    ),

                  ),
                ),
              ],
            );
          },
        )
            : Column(
          children: [
            SizedBox(height: 52.h),
            Center(
              child: AppSvgPicture(
                assetName: IconsApp.image,
                height: 120.h,
                width: 120.w,
              ),
            ),
            SizedBox(height: 29.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.w),
              child: AppText(
                text: context.localizations.must_add_images,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: ColorResource.gray,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 65.h),
          ],
        );
      }
    );
  }
}
