import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haraj/utils/extensions/color_resource/color_resource.dart';

class AppBodyContainer extends StatefulWidget {
  const AppBodyContainer({super.key, required this.body});

  final Widget body;

  @override
  State<AppBodyContainer> createState() => _AppBodyContainerState();
}

class _AppBodyContainerState extends State<AppBodyContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      margin: EdgeInsets.symmetric(vertical: 15.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        color: Colors.white,
        border: Border.all(color: ColorResource.shadeGrey, width: 1.w),
      ),
      child: widget.body,
    );
  }
}
