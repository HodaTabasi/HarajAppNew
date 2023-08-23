import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haraj/utils/extensions/color_resource/color_resource.dart';
import 'package:haraj/widgets/app_svg_picture.dart';
import 'package:haraj/widgets/app_text.dart';

class AppContainerOpenBottomSheet extends StatelessWidget {
  final String title;
  final String image;
  final void Function() onPressed;

  const AppContainerOpenBottomSheet({
    Key? key,
    required this.title,
    required this.image,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 55.h,
        padding: EdgeInsetsDirectional.only(end: 12.w),
        decoration: BoxDecoration(
            color: ColorResource.white,
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(
              color: ColorResource.lightGray,
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 48.h,
              width: 48.w,
              alignment: Alignment.center,
              color: ColorResource.transparent,
              child: AppSvgPicture(
                assetName: image,
              ),
            ),
            const VerticalDivider(
              color: ColorResource.gray,
              width: 0,
            ),
            SizedBox(width: 10.w),
            AppText(
              text: title,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: ColorResource.borderGray1,
            ),
            const Spacer(),
            Icon(
              Icons.arrow_forward_ios_rounded,
              size: 18.w,
            ),
          ],
        ),
      ),
    );
  }
}
