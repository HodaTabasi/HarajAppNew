
import 'package:flutter/material.dart';
import 'package:haraj/utils/extensions/color_resource/color_resource.dart';

import 'SizeConfig.dart';

final otpInputDecoration = InputDecoration(
  contentPadding:
  EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
  focusedBorder: outlineInputBorder(),
  enabledBorder: enableOutlineInputBorder(),
  fillColor: ColorResource.fillgrey,
  filled: true,
  counterStyle: const TextStyle(height: double.minPositive,),
  counterText: "",
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(5)),
    // borderSide: BorderSide(color: Color(0xffDCDCDC)),
  );
}
OutlineInputBorder enableOutlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(5)),
    borderSide: BorderSide.none,
  );
}
