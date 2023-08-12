import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:haraj/utils/extensions/main_extension/context_extension.dart';
import 'package:haraj/utils/extensions/routes/key_routes.dart';
import 'package:haraj/utils/get/localizations/language_getx_controller.dart';
import 'package:haraj/utils/prefs/shared_pref_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefController().initSharedPref();
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
        localizationsDelegates: context.localizationsDelegate,
        supportedLocales: context.supportedLocales,
        locale: Locale(_languageGetxController.language.value),
        initialRoute: KeyRoutes.launchScreen,
        routes: context.routes,
      ),
    );
  }
}
