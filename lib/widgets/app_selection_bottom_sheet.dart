import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haraj/utils/extensions/color_resource/color_resource.dart';
import 'package:haraj/widgets/app_text.dart';

class AppSelectionBottomSheet extends StatelessWidget {
  final String title;
  final int value;
  final int groupValue;
  final void Function(int? value)? onChange;
  final String? logo;
  final bool showCheckbox; // Add a boolean flag to control visibility
  final bool selectCheckbox; // Add a boolean flag to control checkbox selection
  final void Function(bool?)? onChanged; // Callback for checkbox

  const AppSelectionBottomSheet({
    Key? key,
    required this.title,
    this.value = 0,
    this.groupValue = 0,
    this.onChange,
    this.logo,
    this.showCheckbox = false, // Default to false
    this.selectCheckbox = false, // Default to false
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        logo!.isNotEmpty
            ? Container(
                height: 48.h,
                width: 48.w,
                alignment: Alignment.center,
                color: ColorResource.transparent,
                child: Image.network(logo!),
              )
            : const SizedBox(),
        SizedBox(width: 10.w),
        AppText(
          text: title,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: ColorResource.mainFontColor,
        ),
        const Spacer(),
        Visibility(
          visible: !showCheckbox,
          replacement: Checkbox(
            value: selectCheckbox,
            onChanged: onChanged,
            activeColor: ColorResource.mainColor,
          ),
          child: Radio(
            fillColor: MaterialStateColor.resolveWith(
                (states) => ColorResource.mainColor),
            value: value,
            groupValue: groupValue,
            onChanged: onChange,
          ),
        ),
      ],
    );
  }
}
