import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haraj/utils/extensions/color_resource/color_resource.dart';
import 'package:haraj/utils/extensions/routes/custom_shap.dart';
import 'package:haraj/widgets/app_divider.dart';
import 'package:haraj/widgets/app_popup_menu_button.dart';
import 'package:haraj/widgets/app_popup_menu_item.dart';
import 'package:haraj/widgets/app_switch_button.dart';
import 'package:haraj/widgets/app_text.dart';

class AppCarContainer extends StatefulWidget {
  const AppCarContainer(
      {super.key,
      required this.nameCar,
      required this.imageCar,
      required this.priceCar,
      required this.conditionCar,
      required this.showCar,
      required this.postingTime,
      required this.menuItem,
      required this.onSelected});

  final String nameCar;
  final String imageCar;
  final String priceCar;
  final String conditionCar;
  final String showCar;
  final String postingTime;
  final List<AppPopupMenuItem> menuItem;
  final void Function(int) onSelected;

  @override
  State<AppCarContainer> createState() => _AppCarContainerState();
}

class _AppCarContainerState extends State<AppCarContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity.w,
      height: 153.h,
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
                      AppText(
                        text: widget.nameCar,
                        color: ColorResource.mainFontColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      AppPopupMenuButton(
                          menuItems: widget.menuItem,
                          onSelected: widget.onSelected),
                    ],
                  ),
                  AppText(
                    text: widget.priceCar,
                    color: ColorResource.mainFontColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
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
                      const Spacer(),
                      AppText(
                        //TODO: make lang here
                        text: '4K ${widget.showCar}',
                        // text: '4K زائر',
                        color: ColorResource.green,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                  AppDivider(
                      height: 18.h,
                      color: ColorResource.lightGrey,
                      thickness: 1),
                  Row(
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
                      AppSwitchButton(),
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