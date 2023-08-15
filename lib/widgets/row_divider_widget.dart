import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haraj/utils/extensions/color_resource/color_resource.dart';
import 'package:haraj/widgets/app_divider.dart';
import 'package:haraj/widgets/app_text.dart';

class RowDividerWidget extends StatelessWidget {
  final String text;
  final Color? color;

  const RowDividerWidget({super.key, required this.text, this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AppDivider(
              height: 1.h, color: ColorResource.lightGray, thickness: 1),
        ),
        SizedBox(width: 5.w),
        AppText(
          text: text,
          fontWeight: FontWeight.w500,
          color: ColorResource.mainFontColor,
          fontSize: 14.sp,
        ),
        SizedBox(width: 5.w),
        Expanded(
          child: AppDivider(
              height: 1.h, color: ColorResource.lightGray, thickness: 1),
        ),
      ],
    );
  }
}
