import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haraj/utils/extensions/color_resource/color_resource.dart';
import 'package:haraj/widgets/app_svg_picture.dart';
import 'package:haraj/widgets/app_text.dart';

class AppElevatedButton extends StatelessWidget {
  AppElevatedButton({
    required this.title,
    required this.titleColor,
    required this.fontSize,
    required this.widthButton,
    required this.heightButton,
    required this.radius,
    required this.backgroundColor,
    required this.onPressed,
    required this.fontWeight,
    this.assetName,
    Key? key,
  }) : super(key: key);

  String title;
  double widthButton;
  double heightButton;
  double radius;
  Color titleColor;
  Color backgroundColor;
  double fontSize;
  FontWeight fontWeight;
  final void Function() onPressed;
  String? assetName;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      // style: ElevatedButton.styleFrom(
      //   backgroundColor: backgroundColor,
      //   minimumSize: Size(widthButton, heightButton),
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.all(Radius.circular(radius)),
      //   ),
      // ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppSvgPicture(assetName: assetName!, color: ColorResource.white),
          SizedBox(width: 5.w),
          AppText(
            text: title,
            textAlign: TextAlign.center,
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: titleColor,
          ),
        ],
      ),
    );
  }
}
