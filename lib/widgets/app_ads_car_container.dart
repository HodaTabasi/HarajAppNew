import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haraj/utils/extensions/color_resource/color_resource.dart';
import 'package:haraj/utils/extensions/icons_app/icons_app.dart';
import 'package:haraj/widgets/app_divider.dart';
import 'package:haraj/widgets/app_svg_picture.dart';
import 'package:haraj/widgets/app_text.dart';

class AppAdsCarContainer extends StatefulWidget {
  const AppAdsCarContainer({
    super.key,
    required this.nameCar,
    required this.imageCar,
    required this.priceCar,
    required this.conditionCar,
    this.nameLocation = '',
    this.sellerName = 'Mahmoud',
    this.imageSeller = '',
  });

  final String nameCar;
  final String imageCar;
  final String priceCar;
  final String conditionCar;
  final String nameLocation;
  final String sellerName;
  final String imageSeller;

  @override
  State<AppAdsCarContainer> createState() => _AppAdsCarContainerState();
}

class _AppAdsCarContainerState extends State<AppAdsCarContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: ColorResource.white,
        borderRadius: BorderRadius.circular(15.r),
        // border: Border.all(color: ColorResource.lightGray),
        boxShadow: [
          BoxShadow(
            color: ColorResource.lightGrey,
            blurRadius: 10.r,
            spreadRadius: 1,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              Image.network(
                widget.imageCar,
                fit: BoxFit.cover,
                height: 130.h,
                width: double.infinity,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.w),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: CircleAvatar(
                        radius: 15.r,
                        backgroundColor: ColorResource.lightGray,
                        child: AppSvgPicture(
                          assetName: IconsApp.favoriteOutline,
                          width: 12.w,
                          height: 14.h,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 37.h),
                  Container(
                    width: 62.w,
                    height: 27.h,
                    margin:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                    decoration: BoxDecoration(
                      color: ColorResource.white,
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppSvgPicture(
                          assetName: IconsApp.location,
                          width: 10.w,
                          height: 14.h,
                        ),
                        SizedBox(width: 5.w),
                        AppText(
                          text: widget.nameLocation,
                          color: ColorResource.mainFontColor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w300,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(12.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    text: widget.nameCar,
                    color: ColorResource.mainFontColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AppText(
                        //TODO: make lang here
                        text: 'الحالة : ',
                        color: ColorResource.gray,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      AppText(
                        text: widget.conditionCar,
                        color: ColorResource.green,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                  AppText(
                    text: widget.priceCar,
                    color: ColorResource.mainFontColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  AppDivider(
                      height: 18.h,
                      color: ColorResource.lightGrey,
                      thickness: 1),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        color: Colors.white,
                        height: 30.h,
                        width: 30.w,
                        child: CircleAvatar(
                          radius: 20.r,
                          backgroundColor: ColorResource.lightGray,
                          backgroundImage: NetworkImage(widget.imageSeller),
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Expanded(
                        child: AppText(
                          text: widget.sellerName,
                          color: ColorResource.mainFontColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}