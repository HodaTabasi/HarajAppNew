import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haraj/utils/extensions/images_app/images_app.dart';
import 'package:haraj/utils/extensions/routes/key_routes.dart';
import 'package:haraj/utils/prefs/shared_pref_controller.dart';
import 'package:haraj/widgets/app_image.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 2),
      () {
        String route = SharedPrefController().loggedIn
            ? KeyRoutes.mainBuyerScreen
            : KeyRoutes.loginScreen;
        // Navigator.pushReplacementNamed(context, route);
        Navigator.pushReplacementNamed(context, KeyRoutes.loginScreen);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: AppImage(
            imageName: ImagesApp.logo,
            height: 195.h,
            width: 269.w,
          ),
        ),
      ),
    );
  }
}
