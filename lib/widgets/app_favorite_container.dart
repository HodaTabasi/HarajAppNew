import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haraj/utils/extensions/icons_app/icons_app.dart';
import 'package:haraj/widgets/app_svg_picture.dart';
import 'package:haraj/widgets/app_text.dart';

import '../utils/extensions/color_resource/color_resource.dart';

class AppFavoriteContainer extends StatefulWidget {
  final String title;
  final String subTitle;
  final void Function() onTap;

  const AppFavoriteContainer(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.onTap});

  @override
  State<AppFavoriteContainer> createState() => _AppFavoriteContainerState();
}

class _AppFavoriteContainerState extends State<AppFavoriteContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 69.h,
      width: double.infinity,
      alignment: Alignment.center,
      margin: EdgeInsets.only(bottom: 15.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: ColorResource.white,
        border: Border.all(color: ColorResource.shadeGrey, width: 1.w),
        boxShadow: [
          BoxShadow(
            color: ColorResource.lightGrey,
            blurRadius: 5.r,
            spreadRadius: 1,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ListTile(
        horizontalTitleGap: 10.w,
        contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
        minLeadingWidth: 0.w,
        minVerticalPadding: 0.h,
        leading: Container(
          height: 40.h,
          width: 40.w,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.r),
            color: ColorResource.white,
            border: Border.all(color: ColorResource.shadeGrey, width: 1.w),
          ),
          child: Container(
            height: 24.h,
            width: 24.w,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.r),
              color: ColorResource.mainColor,
            ),
            child: AppSvgPicture(
              assetName: IconsApp.searchOutline,
              width: 14.w,
              height: 14.h,
              color: ColorResource.white,
            ),
          ),
        ),
        title: AppText(
          color: ColorResource.mainFontColor,
          text: widget.title,
          fontWeight: FontWeight.w500,
          fontSize: 16.sp,
          textAlign: TextAlign.start,
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AppText(
              color: ColorResource.mainColor,
              text: widget.subTitle,
              fontWeight: FontWeight.w500,
              fontSize: 16.sp,
              textAlign: TextAlign.start,
            ),
            SizedBox(width: 5.w),
            AppText(
              color: ColorResource.gray,
              //TODO:Make Lang Here
              text: 'نتيجة',
              fontWeight: FontWeight.w500,
              fontSize: 16.sp,
              textAlign: TextAlign.start,
            ),
          ],
        ),
        trailing: InkWell(
          onTap: widget.onTap,
          child: Container(
            height: 40.h,
            width: 40.w,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.r),
              color: ColorResource.white,
              border: Border.all(color: ColorResource.shadeGrey, width: 1.w),
            ),
            child: AppSvgPicture(
              assetName: IconsApp.favoriteFill,
              width: 20.w,
              height: 20.h,
              color: ColorResource.mainColor,
            ),
          ),
        ),
      ),
    );
  }
}
