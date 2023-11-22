import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haraj/utils/extensions/color_resource/color_resource.dart';
import 'package:haraj/widgets/app_text.dart';

import '../utils/extensions/icons_app/icons_app.dart';
import 'app_svg_picture.dart';

class AppChatCarContainer extends StatefulWidget {
  const AppChatCarContainer({
    super.key,
    required this.nameCar,
    required this.imageCar,
    required this.priceCar,
    required this.conditionCar,
    required this.postingTime,
  });

  final String nameCar;
  final String? imageCar;
  final String priceCar;
  final String conditionCar;
  final String postingTime;

  @override
  State<AppChatCarContainer> createState() => _AppChatCarContainerState();
}

class _AppChatCarContainerState extends State<AppChatCarContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity.w,
      // height: 102.h,
      margin: EdgeInsets.symmetric(vertical: 10.h),
      decoration: BoxDecoration(
        color: ColorResource.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: ColorResource.lightGray),
      ),
      child: Row(
        children: [
          Column(
            children: [
              (widget.imageCar == null || widget.imageCar == '')
                  ? Container(
                  decoration: BoxDecoration(
                    color: ColorResource.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15.r),
                        bottomRight: Radius.circular(15.r)),
                  ),
                  child: AppSvgPicture(assetName: IconsApp.logoSeller))
                  :
              Container(
                width: 100.w,
                height: 100.h,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: ColorResource.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15.r),
                      bottomRight: Radius.circular(15.r)),
                  image: DecorationImage(
                    image: NetworkImage(widget.imageCar!),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    text: widget.nameCar,
                    color: ColorResource.gray,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AppText(
                        //TODO: make lang here
                        text: 'الحالة : ',
                        color: ColorResource.gray,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      AppText(
                        text: widget.conditionCar,
                        color: ColorResource.gray,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                  SizedBox(height: 7.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AppText(
                        text: widget.priceCar,
                        color: ColorResource.gray,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      AppText(
                        text: widget.postingTime,
                        color: ColorResource.gray,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
