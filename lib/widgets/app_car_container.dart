import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haraj/utils/extensions/color_resource/color_resource.dart';
import 'package:haraj/utils/extensions/main_extension/context_extension.dart';
import 'package:haraj/utils/extensions/routes/custom_shap.dart';
import 'package:haraj/widgets/app_divider.dart';
import 'package:haraj/widgets/app_popup_menu_button.dart';
import 'package:haraj/widgets/app_popup_menu_item.dart';
import 'package:haraj/widgets/app_svg_picture.dart';
import 'package:haraj/widgets/app_switch_button.dart';
import 'package:haraj/widgets/app_text.dart';

class AppCarContainer extends StatefulWidget {
  const AppCarContainer({
    super.key,
    required this.nameCar,
    required this.imageCar,
    required this.priceCar,
    required this.conditionCar,
    required this.showCar,
    required this.postingTime,
    required this.menuItem,
    required this.onSelected,
    this.showLocation = false,
    this.nameLocation = '',
    this.iconLocation = '',
    this.showOfferedPrice = false,
    this.offerPrice = '',
    this.discountPrice = '',
    this.showStatus = false,
    this.showSeller = false,
    this.sellerName = 'Mahmoud',
    this.imageSeller = '',
    this.isSold = false,
    // this.showMenuItem = false,
  });

  final String nameCar;
  final String imageCar;
  final String priceCar;
  final String conditionCar;
  final String showCar;
  final String postingTime;
  final List<AppPopupMenuItem> menuItem;
  final void Function(int) onSelected;
  final bool showLocation;
  final String nameLocation;
  final String iconLocation;
  final bool showOfferedPrice;
  final String offerPrice;
  final String discountPrice;
  final bool showStatus;
  final bool showSeller;
  final String sellerName;
  final String imageSeller;
  final bool isSold;
  // final bool showMenuItem;

  @override
  State<AppCarContainer> createState() => _AppCarContainerState();
}

class _AppCarContainerState extends State<AppCarContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity.w,
      height: 155.h,
      margin: EdgeInsets.symmetric(vertical: 10.h),
      decoration: BoxDecoration(
        color: ColorResource.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: ColorResource.lightGray),
        boxShadow: [
          BoxShadow(
            color: ColorResource.lightGrey,
            blurRadius: 10.r,
            spreadRadius: 1,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Column(
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  SizedBox(
                    width: 127.w,
                    height: 151.h,
                    child: ClipPath(
                      clipper: RPSCustomPainter(),
                      child: Image.network(
                        widget.imageCar,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  widget.showLocation
                      ? Container(
                          width: 62.w,
                          height: 27.h,
                          margin: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 10.h),
                          decoration: BoxDecoration(
                            color: ColorResource.white,
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AppSvgPicture(
                                assetName: widget.iconLocation,
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
                        )
                      : const SizedBox(),
                ],
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: AppText(
                          text: widget.nameCar,
                          color: ColorResource.mainFontColor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          maxLine: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.start,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      AppPopupMenuButton(
                          menuItems: widget.menuItem,
                          onSelected: widget.onSelected),
                    ],
                  ),
                  widget.showOfferedPrice
                      ? Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            AppText(
                              text: "${context.localizations.price_offer} :",
                              color: ColorResource.gray,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                            ),
                            AppText(
                              text: widget.offerPrice,
                              color: ColorResource.mainFontColor,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                            const Spacer(),
                            AppText(
                              text: widget.discountPrice,
                              color: ColorResource.gray,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              textDecoration: TextDecoration.lineThrough,
                            ),
                          ],
                        )
                      : AppText(
                          text: widget.priceCar,
                          color: ColorResource.mainFontColor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                  widget.showStatus
                      ? Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            AppText(
                              //TODO: make lang here
                              text: 'الحالة :',
                              color: ColorResource.gray,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                            Expanded(
                              child: AppText(
                                text: widget.conditionCar,
                                color: ColorResource.green,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                maxLine: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            SizedBox(width: 10.w),
                            AppText(
                              //TODO: make lang here
                              text: widget.showCar,
                              // text: '4K زائر',
                              color: ColorResource.gray,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        )
                      : Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.access_time_rounded,
                              color: ColorResource.gray,
                              size: 18.w,
                            ),
                            SizedBox(width: 5.w),
                            AppText(
                              text: widget.postingTime,
                              color: ColorResource.gray,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                  AppDivider(
                      height: 18.h,
                      color: ColorResource.lightGrey,
                      thickness: 1),
                  widget.showSeller
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              alignment: Alignment.bottomCenter,
                              color: Colors.white,
                              height: 24.h,
                              width: 24.w,
                              child: CircleAvatar(
                                radius: 20.r,
                                backgroundColor: ColorResource.lightGray,
                                backgroundImage:
                                    NetworkImage(widget.imageSeller),
                              ),
                            ),
                            SizedBox(width: 8.w),
                            AppText(
                              text: widget.sellerName,
                              color: ColorResource.mainFontColor,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        )
                      : Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.access_time_rounded,
                              color: ColorResource.gray,
                              size: 18.w,
                            ),
                            SizedBox(width: 5.w),
                            AppText(
                              text: widget.postingTime,
                              color: ColorResource.gray,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                            ),
                            const Spacer(),
                            AppSwitchButton(isSold: widget.isSold),
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
