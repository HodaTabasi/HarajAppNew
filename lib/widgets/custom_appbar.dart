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
  final double imageHeight;
  final bool showSearch;
  final bool showLeading;
  final bool showActions;
  final Function()? leadingAction;
  final TextEditingController? searchController;

  const CustomAppBar({
    Key? key,
    required this.title,
    required this.imageHeight,
    this.leadingAction,
    this.showLeading =
        true, // Set this to true to show the leading icon by default
    this.showActions = false, // Set this to false to hide the Actions icon
    this.showSearch = false,
    this.searchController,
  }) : super(key: key);

  // @override
  // Size get preferredSize => const Size.fromHeight(kToolbarHeight * 2);

  @override
  Size get preferredSize {
    double appBarHeight = kToolbarHeight;
    if (showSearch) {
      appBarHeight += 100.h; // Height for the search field container
    } else {
      appBarHeight += 30.h; // Height for the without search field container
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
          height: imageHeight,
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
                  : null,
              centerTitle: true,
              title: AppText(
                text: title,
              ),
              actions: [
                if (showActions) // Add this condition
                  showActions
                      ? Container(
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
                            onTap: leadingAction,
                            child: AppSvgPicture(
                              assetName: IconsApp.edit,
                              width: 16.w,
                              height: 16.h,
                              color: ColorResource.mainColor,
                            ),
                          ),
                        )
                      : const SizedBox(),
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
          ],
        ),
      ],
    );
  }
}
