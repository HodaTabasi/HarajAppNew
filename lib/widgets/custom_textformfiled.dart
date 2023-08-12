import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haraj/utils/extensions/color_resource/color_resource.dart';
import 'package:haraj/widgets/app_svg_picture.dart';

class AppTextFomField extends StatelessWidget {
  const AppTextFomField(
      {super.key,
      required this.title,
      this.validator,
      this.onFieldSubmitted,
      this.controller,
      this.secure = false,
      this.prefixIcon,
      this.suffixIcon,
      this.radius,
      this.fontFamily,
      this.errorTitle,
      this.floatingLabelBehavior,
      this.color,
      this.fillColor,
      this.fontSize,
      this.maxline,
      this.fontWeight,
      this.textInputType});

  final TextEditingController? controller;
  final TextInputType? textInputType;
  final bool secure;
  final String title;
  final String? errorTitle;
  final double? fontSize;
  final double? radius;
  final IconButton? suffixIcon;
  final String? prefixIcon;
  final String? fontFamily;
  final FontWeight? fontWeight;
  final String? Function(String?)? validator;
  final Function? onFieldSubmitted;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final Color? color;
  final Color? fillColor;
  final int? maxline;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      obscureText: secure,
      cursorColor: ColorResource.mainColor,
      controller: controller,
      keyboardType: textInputType,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius ?? 6.0),
            borderSide: BorderSide.none,
          ),
          labelText: title,
          floatingLabelBehavior: floatingLabelBehavior,
          labelStyle: TextStyle(
              color: ColorResource.borderGray1,
              fontFamily: 'Avenir',
              fontSize: fontSize ?? 14.sp,
              fontWeight: fontWeight ?? FontWeight.w400),
          floatingLabelStyle: TextStyle(
              height: 7.h,
              color: ColorResource.borderGray1,
              fontFamily: 'Avenir',
              fontSize: 12.sp,
              fontWeight: FontWeight.w400),
          filled: true,
          fillColor: fillColor ?? Colors.white.withOpacity(0.5),
          prefixIcon: Container(
            width: 50.w,
            height: 60.h,
            padding: const EdgeInsets.all(12),
            margin: EdgeInsets.only(
              left: 8.r,
            ),
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(
                    color: prefixIcon != null
                        ? ColorResource.secondaryColor
                        : ColorResource.shadeGrey),
              ),
            ),
            child: AppSvgPicture(
              assetName: prefixIcon ?? '',
              height: 16.h,
              width: 16.w,
            ),
          ),
          suffixIcon: suffixIcon,
          errorText: errorTitle,
          errorStyle: const TextStyle(
            color: Colors.red,
            fontFamily: 'Avenir',
          )),
    );
  }
}
