import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haraj/feature/app/auth/forget_password/controller/forget_password_controller.dart';
import 'SizeConfig.dart';
import 'constants.dart';


class ForgetPasswordOtpForm extends StatefulWidget {
  @override
  _ForgetPasswordOtpFormState createState() => _ForgetPasswordOtpFormState();
}

class _ForgetPasswordOtpFormState extends State<ForgetPasswordOtpForm>{
  FocusNode? pin1FocusNode;
  FocusNode? pin2FocusNode;
  FocusNode? pin3FocusNode;
  FocusNode? pin4FocusNode;
  late String myCode;
  late String smsCode;
  late List<String> numbers;

  onPress() async {

  }

  @override
  void initState() {
    super.initState();
    pin1FocusNode = FocusNode();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  @override
  void dispose() {
    super.dispose();
    pin1FocusNode!.dispose();
    pin2FocusNode!.dispose();
    pin3FocusNode!.dispose();
    pin4FocusNode!.dispose();
  }

  void nextField(String value, FocusNode focusNode) {
    if (value.length == 1) {
      focusNode.requestFocus();
    }
  }
  void previousField(String value, FocusNode focusNode) {
      focusNode.requestFocus();

  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Form(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.r,vertical: 8.0.r),
                child: SizedBox(
                  width: getProportionateScreenWidth(50),
                  height: getProportionateScreenHeight(50),
                  child: TextFormField(
                    controller: ForgetPasswordController.to.num4Controller,
                    focusNode: pin4FocusNode,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    obscureText: false,
                    style: TextStyle(fontSize: 16),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: otpInputDecoration,
                    maxLength: 1,
                    onChanged: (value) {
                      if (value.isEmpty) {
                        previousField(value, pin3FocusNode!);
                      } else {
                        pin4FocusNode!.unfocus();
                        onPress();
                      }
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.r,vertical: 8.0.r),
                child: SizedBox(
                  width: getProportionateScreenWidth(50),
                  height: getProportionateScreenHeight(50),
                  child: TextFormField(
                    controller: ForgetPasswordController.to.num3Controller,
                    focusNode: pin3FocusNode,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    obscureText: false,
                    style: TextStyle(fontSize: 16),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: otpInputDecoration,
                    maxLength: 1,
                    onChanged: (value) {
                      if (value.isEmpty) {
                        previousField(value, pin2FocusNode!);
                      } else {
                        nextField(value, pin4FocusNode!);
                      }

                      // if(value.length == 0){
                      //   pin2FocusNode!.requestFocus();
                      // }
                      // _getClipboardText();
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.r,vertical: 8.0.r),
                child: SizedBox(
                  width: getProportionateScreenWidth(50),
                  height: getProportionateScreenHeight(50),
                  child: TextFormField(
                    controller: ForgetPasswordController.to.num2Controller,
                    focusNode: pin2FocusNode,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    obscureText: false,
                    style: TextStyle(fontSize: 16),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: otpInputDecoration,
                    maxLength: 1,
                    onChanged: (value){
                      if (value.isEmpty) {
                        previousField(value, pin1FocusNode!);
                      } else {
                        nextField(value, pin3FocusNode!);
                      }

                      // if(value.length == 0){
                      //   pin2FocusNode!.requestFocus();
                      // }
                      // _getClipboardText();
                    },
                  ),
                ),
              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 8.r,vertical: 8.0.r),
                child: SizedBox(
                  width: getProportionateScreenWidth(50),
                  height: getProportionateScreenHeight(50),
                  child: TextFormField(
                    controller:ForgetPasswordController.to.num1Controller,
                    autofocus: true,
                    focusNode: pin1FocusNode,
                    obscureText: false,
                    style: TextStyle(fontSize: 16),
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    textAlign: TextAlign.center,
                    decoration: otpInputDecoration,
                    maxLength: 1,
                    onChanged: (value) {
                      nextField(value, pin2FocusNode!);
                      // _getClipboardText();
                    },
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }


}
