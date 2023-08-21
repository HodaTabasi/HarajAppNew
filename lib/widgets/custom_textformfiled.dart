import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:haraj/utils/get/general_getx_controller.dart';

import '../utils/extensions/color_resource/color_resource.dart';
import 'app_svg_picture.dart';

class AppTextFomField extends GetView<GeneralGetxController> {
  AppTextFomField(
      {super.key,
      required this.title,
      // this.validator,
      this.onFieldSubmitted,
      this.textController,
      this.suffix,
      this.secure = false,
      this.prefix,
      this.suffixIcon,
      this.radius,
      this.prefixIcon,
      this.fontFamily,
      this.errorTitle,
      this.floatingLabelBehavior,
      this.color,
      this.fillColor,
      this.mainColor,
      this.fontSize,
      this.maxline,
      this.fontWeight,
      this.type = 'name',
      required this.focusNode,
      this.textInputType});

  final TextEditingController? textController;
  final TextInputType? textInputType;
  final Widget? suffix;
  final bool secure;
  final Widget? prefix;
  final String title;
  String? errorTitle;
  final double? fontSize;
  final double? radius;
  final Widget? suffixIcon;
  final String? prefixIcon;
  final String? fontFamily;
  final FontWeight? fontWeight;

  // final String? Function(String?) validator;
  final Function? onFieldSubmitted;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final Color? color;
  final Color? fillColor;
  final int? maxline;
  final Color? mainColor;
  String type = 'name';
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: ColorResource.white,
            borderRadius: BorderRadius.circular(8.r),
            border: errorTitle!.isNotEmpty
                ? Border.all(color: ColorResource.red, width: 0.5.r)
                : Border.all(color: ColorResource.lightGray, width: 0.5.r),
          ),
          child: IntrinsicHeight(
            child: Row(
              children: [
                Container(
                  height: 48.h,
                  width: 48.w,
                  alignment: Alignment.center,
                  color: ColorResource.transparent,
                  child: AppSvgPicture(
                    assetName: prefixIcon ?? '',
                    height: 22.h,
                    width: 22.w,
                  ),
                ),
                const VerticalDivider(
                  color: ColorResource.gray,
                  width: 0,
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: TextFormField(
                    // validator: validator,
                    focusNode: focusNode,
                    onChanged: (value) {
                      errorTitle = controller.validator(value, type) ?? '';
                      focusNode.requestFocus();
                    },
                    obscureText: secure,
                    cursorColor: mainColor,
                    controller: textController,
                    keyboardType: textInputType,
                    textInputAction: TextInputAction.next,
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
                    ),
                  ),
                ),
                suffixIcon ?? const Center()
              ],
            ),
          ),
        ),
        Visibility(
          visible: errorTitle != null,
          child: Text(
            errorTitle ?? '',
            style: TextStyle(color: ColorResource.red, fontSize: 12.sp),
          ),
        )
      ],
    );
  }
}

// class AppTextFomField extends StatelessWidget {
//   const AppTextFomField(
//       {super.key,
//       required this.title,
//       this.validator,
//       this.onFieldSubmitted,
//       this.controller,
//       this.secure = false,
//       this.prefixIcon,
//       this.suffixIcon,
//       this.radius,
//       this.fontFamily,
//       this.errorTitle,
//       this.floatingLabelBehavior,
//       this.color,
//       this.fillColor,
//       this.fontSize,
//       this.maxline,
//       this.fontWeight,
//       this.textInputType});
//
//   final TextEditingController? controller;
//   final TextInputType? textInputType;
//   final bool secure;
//   final String title;
//   final String? errorTitle;
//   final double? fontSize;
//   final double? radius;
//   final IconButton? suffixIcon;
//   final String? prefixIcon;
//   final String? fontFamily;
//   final FontWeight? fontWeight;
//   final String? Function(String?)? validator;
//   final Function? onFieldSubmitted;
//   final FloatingLabelBehavior? floatingLabelBehavior;
//   final Color? color;
//   final Color? fillColor;
//   final int? maxline;
//
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       validator: validator,
//       obscureText: secure,
//       cursorColor: ColorResource.mainColor,
//       controller: controller,
//       keyboardType: textInputType,
//       decoration: InputDecoration(
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(radius ?? 6.0),
//             borderSide: BorderSide.none,
//           ),
//           labelText: title,
//           floatingLabelBehavior: floatingLabelBehavior,
//           labelStyle: TextStyle(
//               color: ColorResource.borderGray1,
//               fontFamily: 'Avenir',
//               fontSize: fontSize ?? 14.sp,
//               fontWeight: fontWeight ?? FontWeight.w400),
//           floatingLabelStyle: TextStyle(
//               height: 7.h,
//               color: ColorResource.borderGray1,
//               fontFamily: 'Avenir',
//               fontSize: 12.sp,
//               fontWeight: FontWeight.w400),
//           filled: true,
//           fillColor: fillColor ?? Colors.white.withOpacity(0.5),
//           prefixIcon: Container(
//             width: 50.w,
//             height: 60.h,
//             padding: const EdgeInsets.all(12),
//             margin: EdgeInsets.only(
//               left: 8.r,
//             ),
//             decoration: BoxDecoration(
//               border: Border(
//                 left: BorderSide(
//                     color: prefixIcon != null
//                         ? ColorResource.secondaryColor
//                         : ColorResource.shadeGrey),
//               ),
//             ),
//             child: AppSvgPicture(
//               assetName: prefixIcon ?? '',
//               height: 16.h,
//               width: 16.w,
//             ),
//           ),
//           suffixIcon: suffixIcon,
//           errorText: errorTitle,
//
//           errorStyle: const TextStyle(
//             color: Colors.red,
//             fontFamily: 'Avenir',
//           )),
//     );
//   }
// }
