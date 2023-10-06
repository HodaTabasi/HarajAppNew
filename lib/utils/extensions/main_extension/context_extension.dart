import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:haraj/feature/app/auth/login/view/screen/login_screen.dart';
import 'package:haraj/feature/app/auth/register/view/screen/register_screen.dart';
import 'package:haraj/feature/app/profile/seller/add_address_seller/view/screen/add_address_seller_screen.dart';
import 'package:haraj/feature/app/profile/seller/complete_store_seller/view/screen/complete_store_seller_screen.dart';
import 'package:haraj/feature/core/launch_screen.dart';
import 'package:haraj/utils/extensions/color_resource/color_resource.dart';
import 'package:haraj/utils/extensions/routes/key_routes.dart';
import 'package:url_launcher/url_launcher.dart';


///General Extension App
extension ContextExtension on BuildContext {
  ///SnackBar For App
  void showSnackBar({required String message, bool error = false}) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: error ? ColorResource.red : ColorResource.green,
        duration: const Duration(seconds: 3),
        dismissDirection: DismissDirection.horizontal,
      ),
    );
  }

  ///Localizations App
  List<LocalizationsDelegate<dynamic>> get localizationsDelegate =>
      AppLocalizations.localizationsDelegates;

  List<Locale> get supportedLocales => AppLocalizations.supportedLocales;

  AppLocalizations get localizations => AppLocalizations.of(this)!;

  ///ThemeDate App
  ThemeData get appTheme => ThemeData(
        scaffoldBackgroundColor: ColorResource.white,
        useMaterial3: true,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: ColorResource.mainColor,
          secondary: ColorResource.secondaryColor,
        ),
        fontFamily: 'Avenir',
        textTheme: TextTheme(
          bodySmall: TextStyle(
              fontSize: 12.sp,
              color: ColorResource.black,
              fontWeight: FontWeight.w300),
          bodyMedium: TextStyle(
              fontSize: 15.sp,
              color: ColorResource.black,
              fontWeight: FontWeight.w500),
          bodyLarge: TextStyle(
              fontSize: 15.sp,
              color: ColorResource.black,
              fontWeight: FontWeight.bold),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: ColorResource.lightGray,
          elevation: 0,
          centerTitle: true,
          iconTheme: IconThemeData(color: ColorResource.black),
          // toolbarHeight: 48,
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
          contentPadding: EdgeInsets.only(top: 12.h, right: 10.w),
          hintStyle: TextStyle(
            fontSize: 12.sp,
            color: ColorResource.darkGray,
            fontWeight: FontWeight.w300,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            minimumSize: Size(double.infinity, 48.h),
            backgroundColor: ColorResource.mainColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6.r),
            ),
          ),
        ),
     unselectedWidgetColor: Colors.red,
      );

  ///Routes App
  Map<String, WidgetBuilder> get routes => {
        //***************************SHARED SCREENS*****************************
        //---------------------------LAUNCH SCREENS-----------------------------
        KeyRoutes.launchScreen: (context) => const LaunchScreen(),
        //---------------------------AUTH SCREENS-------------------------------
        KeyRoutes.loginScreen: (context) => LoginScreen(),
        KeyRoutes.registerScreen: (context) => RegisterScreen(),
        // KeyRoutes.otpScreen: (context) => const OTPFirstScreen(),
        // KeyRoutes.afterOtpScreen: (context) => const OTPAfterScreen(),
        // KeyRoutes.changeEmailScreen: (context) => const ChangeEmailScreen(),
        // //---------------------------CHAT SCREENS-------------------------------
        // KeyRoutes.chatScreen: (context) => const ChatScreen(),
        // KeyRoutes.chatDetailScreen: (context) => const ChatDetailScreen(),
        // //---------------------------SETTING SCREENS----------------------------
        // KeyRoutes.settingScreen: (context) => const SettingScreen(),
        // //***************************BUYER SCREENS******************************
        // KeyRoutes.mainBuyerScreen: (context) => const BuyerMainScreen(),
        // //TODO:He wants to check this screen if buyer or seller
        // KeyRoutes.homeBuyerScreen: (context) => const SellerHomeScreen(),
        // KeyRoutes.profileBuyerScreen: (context) => const ProfileSellerScreen(),
        // //
        // KeyRoutes.searchBuyerScreen: (context) => const BuyerSearchScreen(),
        // KeyRoutes.filterBuyerScreen: (context) => const BuyerFilterScreen(),
        // KeyRoutes.editProfileBuyerScreen: (context) =>
        //     const EditProfileBuyerScreen(),
        // KeyRoutes.completeProfileBuyerScreen: (context) =>
        //     CompleteProfileBuyerScreen(),
        // KeyRoutes.favoriteBuyerScreen: (context) => const FavoriteBuyerScreen(),
        // KeyRoutes.productDetailsBuyerScreen: (context) =>
        //     const productDetailsBuyerScreen(),
        // KeyRoutes.galleryBuyerScreen: (context) => const GalleryBuyerScreen(),
        // KeyRoutes.changePasswordBuyerScreen: (context) =>
        //     const ChangePasswordBuyerScreen(
        //       password: '',
        //     ),
        // //***************************SELLER SCREENS*****************************
        // KeyRoutes.mainSellerScreen: (context) => const SellerMainScreen(),
        // KeyRoutes.addADSSellerScreen: (context) => const AddAdSSellerScreen(),
        // KeyRoutes.contactInfoSellerScreen: (context) =>
        //     const ContactInfoSellerScreen(),
        // // KeyRoutes.editContactInfoSellerScreen: (context) => const EditContactInfoScreen(),
        // KeyRoutes.editCarInfoSellerScreen: (context) =>
        //     const EditCarInfoSellerScreen(),
        // KeyRoutes.editCarImageSellerScreen: (context) =>
        //     const EditCarImageSellerScreen(),
        // KeyRoutes.profileSellerScreen: (context) => ProfileSellerScreen(),
        // KeyRoutes.personalInfoSellerScreen: (context) =>
        //     const PersonalInfoSellerScreen(),
        // KeyRoutes.editPersonalSellerScreen: (context) =>
        //     const EditPersonalSellerScreen(),
        // KeyRoutes.completeProfileSellerScreen: (context) =>
        //     CompleteProfileSellerScreen(),
        // KeyRoutes.completeStoreSellerScreen: (context) =>
        //     CompleteStoreSellerScreen(),
        // KeyRoutes.imageStoreSellerScreen: (context) =>
        //     const ImageStoreSellerScreen(),
        // KeyRoutes.addAddressSellerScreen: (context) => AddAddressSellerScreen(),
        // KeyRoutes.subscriptionSellerScreen: (context) =>
        //     const SubscriptionSellerScreen(),
        // KeyRoutes.adsDetailSellerScreen: (context) =>
        //     const AdsDetailSellerScreen(),
        // KeyRoutes.infoAddressSellerScreen: (context) =>
        //     const InfoAddressSellerScreen(),
      };


  getPackageNameFun(){
  if (Platform.isAndroid || Platform.isIOS) {
    final appId = Platform.isAndroid ? 'com.app.harage.hatage_app' : 'YOUR_IOS_APP_ID';
    final url = Uri.parse(
      Platform.isAndroid
          ? "market://details?id=$appId"
          : "https://apps.apple.com/app/id$appId",
    );
    return url;
    // launchUrl(
    //   url,
    //   mode: LaunchMode.externalApplication,
    // );
  }
}

  Future<void> launchTUrl(url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  Future<void> launchFaceBookUrl(url) async {
    String fbProtocolUrl;
    if (Platform.isIOS) {
      fbProtocolUrl = 'fb://profile/100092446166287';
    } else {
      fbProtocolUrl = 'fb://profile/100092446166287';
      // fbProtocolUrl = 'fb://page/100092446166287';
    }
//https://www.facebook.com/profile.php?id=100092446166287
    String fallbackUrl = "https://www.facebook.com/profile.php";

    try {
      Uri fbBundleUri = Uri.parse(fbProtocolUrl);
      var canLaunchNatively = await canLaunchUrl(fbBundleUri);

      if (canLaunchNatively) {
        launchUrl(fbBundleUri);
      } else {
        await launchUrl(Uri.parse(fbProtocolUrl),
            mode: LaunchMode.externalApplication);
      }
    } catch (e, st) {
      // Handle this as you prefer
    }
  }
}
