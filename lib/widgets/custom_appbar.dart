import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haraj/utils/extensions/color_resource/color_resource.dart';
import 'package:haraj/utils/extensions/icons_app/icons_app.dart';
import 'package:haraj/utils/extensions/images_app/images_app.dart';
import 'package:haraj/widgets/app_image.dart';
import 'package:haraj/widgets/app_svg_picture.dart';
import 'package:haraj/widgets/app_swiper.dart';
import 'package:haraj/widgets/app_text.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final double heightBackground;
  final bool showSearch;
  final bool showLeading;
  final bool showActions;
  final Function()? actionOnTap;
  final TextEditingController? searchController;
  final bool showSwiper;
  final double heightSwiper;
  final int itemCountSwiper;
  final double viewportFractionSwiper;
  final String imageSwiper;
  final bool showActionHomeBuyer;
  final Function()? actionOnTapHomeBuyer;
  final bool showLeadingHomeBuyer;
  final Function()? leadingOnTapHomeBuyer;
  final String actionAssetName;
  final Color? actionIconColor;

  const CustomAppBar({
    Key? key,
    required this.title,
    required this.heightBackground,
    this.actionOnTap,
    this.showLeading =
        true, // Set this to true to show the leading icon by default
    this.showActions = false, // Set this to false to hide the Actions icon
    this.showSearch = false,
    this.searchController,
    this.showSwiper = false,
    this.heightSwiper = 160,
    this.itemCountSwiper = 3,
    this.viewportFractionSwiper = 0.8,
    this.imageSwiper = '',
    this.showActionHomeBuyer = false,
    this.actionOnTapHomeBuyer,
    this.showLeadingHomeBuyer = false,
    this.leadingOnTapHomeBuyer,
    this.actionAssetName = '',
    this.actionIconColor,
  }) : super(key: key);

  // @override
  // Size get preferredSize => const Size.fromHeight(kToolbarHeight * 2);

  @override
  Size get preferredSize {
    double appBarHeight = kToolbarHeight;

    // Constants for height values
    final searchFieldHeight = 100.h;
    final withoutSearchHeight = 30.h;
    final swiperHeight = 180.h;

    if (showSearch) {
      appBarHeight += searchFieldHeight;
    } else {
      appBarHeight += withoutSearchHeight;
    }

    if (showSwiper) {
      appBarHeight += swiperHeight;
    }

    return Size.fromHeight(appBarHeight);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AppImage(
          imageName: ImagesApp.appBarBackground, // Replace with your image name
          width: double.infinity,
          height: heightBackground,
          fit: BoxFit.fill,
        ),
        Column(
          children: [
            AppBar(
              backgroundColor: Colors.transparent,
              automaticallyImplyLeading: false,
              leading: showLeading
                  ? IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back_ios,
                          color: ColorResource.black),
                    )
                  : showLeadingHomeBuyer
                      ? Container(
                          width: 28.w,
                          height: 28.h,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: ColorResource.transparent,
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                          child: InkWell(
                            onTap: leadingOnTapHomeBuyer,
                            child: AppSvgPicture(
                              assetName: IconsApp.filter,
                              width: 20.w,
                              height: 18.h,
                              color: ColorResource.gray,
                            ),
                          ),
                        )
                      : null,
              centerTitle: true,
              title: AppText(
                text: title,
              ),
              actions: [
                if (showActions) // Add this condition
                  Container(
                    width: 28.w,
                    height: 28.h,
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: 16.w),
                    decoration: BoxDecoration(
                      color: ColorResource.white,
                      borderRadius: BorderRadius.circular(16.r),
                      boxShadow: [
                        BoxShadow(
                          color: ColorResource.gray,
                          blurRadius: 15.r,
                          spreadRadius: 1,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: InkWell(
                      onTap: actionOnTap,
                      child: AppSvgPicture(
                        assetName: actionAssetName,
                        width: 16.w,
                        height: 16.h,
                        color: actionIconColor,
                      ),
                    ),
                  ),
                if (showActionHomeBuyer) // Add this condition
                  Container(
                    width: 28.w,
                    height: 28.h,
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: 16.w),
                    decoration: BoxDecoration(
                      color: ColorResource.transparent,
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: InkWell(
                      onTap: actionOnTapHomeBuyer,
                      child: AppSvgPicture(
                        assetName: IconsApp.notification,
                        width: 17.w,
                        height: 18.h,
                        color: ColorResource.gray,
                      ),
                    ),
                  ),
                // Empty space when showActionButton is false
              ],
            ),
            if (showSearch)
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                child: TextField(
                  controller: searchController,
                  decoration: const InputDecoration(
                    hintText: 'Search...',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            if (showSwiper)
              AppSwiper(
                height: heightSwiper,
                itemCount: itemCountSwiper,
                viewportFraction: viewportFractionSwiper,
                imageSwiper: imageSwiper,
              ),
          ],
        ),
      ],
    );
  }
}
