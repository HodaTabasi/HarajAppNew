import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haraj/utils/extensions/color_resource/color_resource.dart';

class CustomRichText extends StatelessWidget {
  final String mainText;
  final String greenText;
  final String secondaryText;
  final String secondGreenText;
  final String additionalText;

  final Color mainTextColor;
  final Color greenTextColor;
  final Color secondaryTextColor;

  final double fontSize;

  CustomRichText({
    required this.mainText,
    required this.greenText,
    required this.secondaryText,
    required this.secondGreenText,
    required this.additionalText,
    required this.fontSize,
    this.mainTextColor = ColorResource.black,
    this.greenTextColor = ColorResource.green,
    this.secondaryTextColor = ColorResource.gray,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
            text: mainText,
            style: TextStyle(
              color: mainTextColor,
              fontSize: 15.sp,
              // fontSize: fontSize,
            ),
          ),
          TextSpan(
            text: greenText,
            style: TextStyle(
              color: greenTextColor,
              fontSize: fontSize,
            ),
          ),
          TextSpan(
            text: secondaryText,
            style: TextStyle(
              color: secondaryTextColor,
              fontSize: fontSize,
            ),
          ),
          TextSpan(
            text: secondGreenText,
            style: TextStyle(
              color: greenTextColor,
              fontSize: fontSize,
            ),
          ),
          TextSpan(
            text: additionalText,
            style: TextStyle(
              color: mainTextColor,
              fontSize: fontSize,
            ),
          ),
        ],
      ),
    );
  }
}
