import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haraj/utils/extensions/color_resource/color_resource.dart';
import 'package:haraj/widgets/app_text.dart';

class AppSelectableContainer extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onTap;
  final String label;

  const AppSelectableContainer({
    required this.isSelected,
    required this.onTap,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 147.w,
        height: 34.h,
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 3.r),
        decoration: BoxDecoration(
            color: isSelected
                ? ColorResource.mainColor.withOpacity(0.05)
                : ColorResource.white,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(
              color: isSelected
                  ? ColorResource.mainColor
                  : ColorResource.lightGray,
            )),
        child: AppText(
          text: label,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: isSelected ? ColorResource.mainColor : ColorResource.gray,
        ),
      ),
    );
  }
}
