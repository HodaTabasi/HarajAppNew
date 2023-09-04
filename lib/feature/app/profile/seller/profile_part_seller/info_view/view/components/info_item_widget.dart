// part of seller_info_view;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../../utils/extensions/color_resource/color_resource.dart';
import '../../../../../../../../widgets/app_svg_picture.dart';
import '../../../../../../../../widgets/app_text.dart';

class InfoItemWidget extends StatelessWidget {
  final String text;
  final String title;
  final String icon;
  const InfoItemWidget({
    super.key,
    required this.title,
    required this.text,
    required this.icon
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(text: title,color: ColorResource.iconGrey),
        SizedBox(height: 12.h,),
        Row(
          children: [
            AppSvgPicture(assetName: icon,height: 20.r,width: 20.r,),
            SizedBox(width: 12.w,),
            AppText(text: text)
          ],
        ),
        Divider(
          color: ColorResource.dividerVirticalColor,
          thickness: 0.5,
        ),
        SizedBox(
          height: 20.h,
        )
      ],
    );
  }
}
