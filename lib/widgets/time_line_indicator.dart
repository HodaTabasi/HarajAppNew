import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haraj/utils/extensions/color_resource/color_resource.dart';

class TimeLineIndicator extends StatelessWidget {
  const TimeLineIndicator(
      {Key? key, this.endMargin = 0, required this.selected})
      : super(key: key);

  final double endMargin;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      margin: EdgeInsetsDirectional.only(end: endMargin),
      width: 74.w,
      height: 3.h,
      decoration: BoxDecoration(
          color: selected ? ColorResource.green : ColorResource.secondaryColor,
          borderRadius: BorderRadius.circular(25.r)),
    );
  }
}
