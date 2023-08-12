import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haraj/utils/extensions/color_resource/color_resource.dart';
import 'package:haraj/utils/prefs/shared_pref_controller.dart';

mixin Helpers {
  void showSnackBar(
      {required BuildContext context,
      required String message,
      bool error = false}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: error ? ColorResource.red : ColorResource.green,
      behavior: SnackBarBehavior.floating, duration: const Duration(seconds: 2),
      margin: EdgeInsetsDirectional.only(bottom: 20.h, start: 20.w, end: 20.w),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      //This is New Property to dismiss snackBar
      dismissDirection: DismissDirection.horizontal,
    ));
  }

  // Future<void> logOut(BuildContext context) async {
  //   bool loggedOut = await AuthApiController().logout();
  //   if (loggedOut) {
  //     Future.delayed(const Duration(microseconds: 500), () {
  //       Navigator.pushReplacementNamed(context, KeyRoutes.loginScreen);
  //     });
  //   }
  // }

  Map<String, String> get headers {
    var headers = {
      'Accept': 'application/json',
    };
    if (SharedPrefController().loggedIn) {
      headers['Authorization'] = SharedPrefController().token;
      // headers['Authorization'] = 'Bearer TOKEN';
    } else if (SharedPrefController().register) {
      headers['Authorization'] = SharedPrefController().token;
      // headers['Authorization'] = 'Bearer TOKEN';
    }
    return headers;
  }
}
