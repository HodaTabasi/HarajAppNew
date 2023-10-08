import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:haraj/feature/app/dashboard/buyer/dashboard_buyer/views/bn_screens/home_buyer/controllers/home_buyer_controller.dart';
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
    this.sellerName = '',
    this.imageSeller = '',
    this.index = 0,
    this.id = 0,
    this.isFavorite = false,
    this.FavoriteOnTap,
  });

  final String nameCar;
  final String imageCar;
  final String priceCar;
  final String conditionCar;
  final String nameLocation;
  final String sellerName;
  final String imageSeller;
  final bool isFavorite;
  final int index;
  final int id;
  final void Function()? FavoriteOnTap;

  @override
  State<AppAdsCarContainer> createState() => _AppAdsCarContainerState();
}

class _AppAdsCarContainerState extends State<AppAdsCarContainer> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
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
                        child: InkWell(
                          onTap: () {
                            HomeBuyerController.to.toggleFavorite(
                                postId: widget.id, index: widget.index);
                          },
                          child: CircleAvatar(
                            radius: 15.r,
                            backgroundColor: ColorResource.lightGray,
                            child: AppSvgPicture(
                                        assetName: HomeBuyerController.to
                                                .ads.value[widget.index].isFavorite!
                                            ? IconsApp.favoriteFill
                                            : IconsApp.favoriteOutline,
                                        width: 12.w,
                                        height: 14.h,
                                      ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 37.h),
                    Container(
                      width: 80.w,
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
                            assetName: IconsApp.location,
                            width: 10.w,
                            height: 14.h,
                          ),
                          SizedBox(width: 5.w),
                          Flexible(
                            child: AppText(
                              text: widget.nameLocation,
                              color: ColorResource.mainFontColor,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w300,
                              overflow: TextOverflow.ellipsis,
                            ),
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
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        AppText(
                          //TODO: make lang here
                          text: 'الحالة :',
                          color: ColorResource.gray,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        Flexible(
                          child: AppText(
                            text: widget.conditionCar,
                            color: ColorResource.green,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            overflow: TextOverflow.ellipsis,
                          ),
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
                          width: 35.w,
                          child: CircleAvatar(
                            radius: 15.r,
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
    });
  }
}
