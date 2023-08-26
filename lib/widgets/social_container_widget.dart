import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haraj/utils/extensions/color_resource/color_resource.dart';
import 'package:haraj/widgets/app_svg_picture.dart';

class SocialContainer extends StatelessWidget {
  final String nameIcon;
  final void Function() onPressed;

  SocialContainer({super.key, required this.nameIcon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15.w),
        width: 54.w,
        height: 54.h,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
                color: ColorResource.lightGrey,
                blurRadius: 5.0,
                offset: Offset(1, 1))
          ],
          borderRadius: BorderRadius.circular(50.r),
        ),
        child: Center(
          child: AppSvgPicture(
            assetName: nameIcon,
            width: 22.w,
            height: 22.h,
          ),
        ),
      ),
    );
  }
}
