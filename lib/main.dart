import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:haraj/firebase_options.dart';
import 'package:haraj/utils/extensions/helpers/fb_notifications.dart';
import 'package:haraj/utils/extensions/main_extension/context_extension.dart';
import 'package:haraj/utils/extensions/routes/key_routes.dart';
import 'package:haraj/utils/get/localizations/language_getx_controller.dart';
import 'package:haraj/utils/main_injections.dart';
import 'package:haraj/utils/prefs/shared_pref_controller.dart';
import 'package:haraj/utils/translation_file.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefController().initSharedPref();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FbNotifications.initNotifications();
  // await FbNotifications.getToken();

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
        initialBinding: MainInjection(),
        builder: EasyLoading.init(), // your translations
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
