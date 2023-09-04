import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:haraj/feature/app/auth/otp/view/screen/otp_screen.dart';
import 'package:haraj/firebase_options.dart';
import 'package:haraj/feature/app/profile/seller/profile_part_seller/info_view/view/screens/personal_info_seller.dart';
import 'package:haraj/utils/extensions/main_extension/context_extension.dart';
import 'package:haraj/utils/extensions/routes/key_routes.dart';
import 'package:haraj/utils/get/general_getx_controller.dart';
import 'package:haraj/utils/get/localizations/language_getx_controller.dart';
import 'package:haraj/utils/main_injections.dart';
import 'package:haraj/utils/prefs/shared_pref_controller.dart';
import 'package:haraj/utils/translation_file.dart';

import 'feature/app/profile/seller/profile_part_seller/info_view/view/screens/address_info_seller.dart';
import 'feature/app/profile/seller/profile_part_seller/info_view/view/screens/haraj_info_seller.dart';
import 'feature/app/profile/seller/public_profile_seller/view/screen/setting.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefController().initSharedPref();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final LanguageGetxController _languageGetxController =
      Get.put<LanguageGetxController>(LanguageGetxController());

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: const Size(375, 812),
      builder: (context, child) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: context.appTheme,
        translations: TranslateApp(),
        initialBinding: MainInjection(),// your translations
        // fallbackLocale: Locale('en', 'UK'),
        localizationsDelegates: context.localizationsDelegate,
        supportedLocales: context.supportedLocales,
        locale: Locale(_languageGetxController.language.value),
        initialRoute: KeyRoutes.launchScreen,
        // initialRoute: KeyRoutes.profileSellerScreen,
        // home: OTPScreen(),
        routes: context.routes,
      ),
    );
  }
}
