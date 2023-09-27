import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haraj/utils/extensions/color_resource/color_resource.dart';
import 'package:haraj/utils/extensions/icons_app/icons_app.dart';
import 'package:haraj/utils/extensions/images_app/images_app.dart';
import 'package:haraj/widgets/app_image.dart';
import 'package:haraj/widgets/app_svg_picture.dart';
import 'package:haraj/widgets/app_text.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final double heightBackground;
  final bool showSearch;
  final bool showLeading;
  final bool showActions;
  final Widget? appActions;
  final TextEditingController? searchController;
  final void Function(String)? onChanged;
  final void Function()? clearOnPressed;
  final bool showSwiper;
  final Widget? appSwiper;
  final bool showActionHomeBuyer;
  final Function()? actionOnTapHomeBuyer;
  final bool showLeadingHomeBuyer;
  final Function()? leadingOnTapHomeBuyer;

  const CustomAppBar({
    Key? key,
    required this.title,
    required this.heightBackground,
    this.showLeading =
        true, // Set this to true to show the leading icon by default
    this.showActions = false, // Set this to false to hide the Actions icon
    this.appActions,
    this.showSearch = false,
    this.searchController,
    this.onChanged,
    this.clearOnPressed,
    this.showSwiper = false,
    this.appSwiper,
    this.showActionHomeBuyer = false,
    this.actionOnTapHomeBuyer,
    this.showLeadingHomeBuyer = false,
    this.leadingOnTapHomeBuyer,
  }) : super(key: key);

  // @override
  // Size get preferredSize => const Size.fromHeight(kToolbarHeight * 2);

  @override
  Size get preferredSize {
    double appBarHeight = kToolbarHeight;

    // Constants for height values
    final searchFieldHeight = 80.h;
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
                    child: appActions,
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
                height: 48.h,
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: TextField(
                  controller: searchController,
                  onChanged: onChanged,
                  decoration: InputDecoration(
                    fillColor: ColorResource.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.0.r),
                      borderSide: BorderSide.none,
                    ),
                    //TODO:Make Lang here
                    filled: true,
                    labelText: "Search...",
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    labelStyle: TextStyle(
                        color: ColorResource.borderGray1,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400),
                    floatingLabelStyle: TextStyle(
                        height: 7.h,
                        color: ColorResource.borderGray1,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400),
                    suffix: IconButton(
                        onPressed: clearOnPressed,
                        icon: const Icon(Icons.clear_rounded)),
                  ),
                ),
              ),
            if (showSwiper) appSwiper!,
          ],
        ),
      ],
    );
  }
}
