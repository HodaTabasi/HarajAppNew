import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haraj/utils/extensions/color_resource/color_resource.dart';
import 'package:haraj/widgets/app_svg_picture.dart';

class AppPopupMenuItem extends PopupMenuItem<int> {
  final String iconAsset;
  final String title;
  final Color iconColor;
  final int value;

  AppPopupMenuItem({
    required this.iconAsset,
    required this.title,
    required this.iconColor,
    required this.value,
  }) : super(
          value: value,
          child: Row(
            children: [
              AppSvgPicture(
                assetName: iconAsset,
                width: 14.w,
                height: 14.h,
                color: iconColor,
              ),
              SizedBox(width: 10.w),
              Text(
                title,
                style: TextStyle(
                  color: ColorResource.mainFontColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        );
}
