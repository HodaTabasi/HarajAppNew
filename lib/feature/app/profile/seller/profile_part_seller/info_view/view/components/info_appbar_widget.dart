// part of seller_info_view;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../../utils/extensions/color_resource/color_resource.dart';
import '../../../../../../../../utils/extensions/icons_app/icons_app.dart';
import '../../../../../../../../widgets/app_svg_picture.dart';
import '../../../../../../../../widgets/app_text.dart';

class InfoAppBarWidget extends StatelessWidget {
  final String text;
  const InfoAppBarWidget({
    super.key,
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PositionedDirectional(
            start: 0,
            top: 0,
            end: 0,
            child: AppSvgPicture(
              assetName: IconsApp.tabBar,
              height: 110.h,
            )),
        PositionedDirectional(
          top: 2,
          start: 0,
          end: 0,
          child: AppBar(
              backgroundColor: Colors.transparent,
              centerTitle: true,
              title: AppText(text: text, fontSize: 18.sp),
              leading: IconButton(
                onPressed: () {},
                icon: Icon(Icons.arrow_back_ios,
                    color: ColorResource.black, size: 18.r),
              ),
              actions: [
                InkWell(
                    onTap: () {},
                    child: AppSvgPicture(
                      assetName: IconsApp.editIcon,
                      width: 30.r,
                    ))
              ]),
        )
      ],
    );
  }
}
