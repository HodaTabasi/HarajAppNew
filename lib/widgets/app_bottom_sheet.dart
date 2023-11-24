import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haraj/utils/extensions/color_resource/color_resource.dart';

class AppBottomSheet extends StatefulWidget {
  final double? height;
  final Widget body;

  const AppBottomSheet({Key? key, this.height, required this.body})
      : super(key: key);

  @override
  State<AppBottomSheet> createState() => _AppBottomSheetState();
}

class _AppBottomSheetState extends State<AppBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: ColorResource.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.r),
          topRight: Radius.circular(30.r),
          bottomLeft: Radius.circular(0.r),
          bottomRight: Radius.circular(0.r),
        ),
      ),
      child: widget.body,
    );
  }
}
