import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haraj/feature/app/chat/view/screen/home_chat_screen.dart';
import 'package:haraj/feature/app/dashboard/buyer/dashboard_buyer/views/bn_screens/favorite_buyer/views/screens/favorite_buyer_screen.dart';
import 'package:haraj/feature/app/dashboard/buyer/dashboard_buyer/views/bn_screens/home_buyer/views/screens/home_buyer_screen.dart';
import 'package:haraj/feature/app/dashboard/buyer/dashboard_buyer/views/bn_screens/profile_buyer/views/screens/profile_buyer_screen.dart';
import 'package:haraj/feature/app/dashboard/buyer/dashboard_buyer/views/bn_screens/search_buyer/views/screens/search_buyer_screen.dart';
import 'package:haraj/utils/extensions/color_resource/color_resource.dart';
import 'package:haraj/utils/extensions/icons_app/icons_app.dart';
import 'package:haraj/utils/models/bn_model/bn_model.dart';
import 'package:haraj/widgets/app_svg_picture.dart';

import '../../../../../../utils/extensions/helpers/fb_notifications.dart';
import '../../../../../../utils/get/general_getx_controller.dart';
import '../../../../../../utils/prefs/shared_pref_controller.dart';
import '../../../../profile/seller/add_address_seller/controller/add_address_seller_controller.dart';

class DashboardBuyerScreen extends StatefulWidget {
  const DashboardBuyerScreen({super.key});

  @override
  State<DashboardBuyerScreen> createState() => _DashboardBuyerScreenState();
}

class _DashboardBuyerScreenState extends State<DashboardBuyerScreen> {
  int _currentIndex = 0;

  final List<BnModel> _bnScreen = <BnModel>[
    BnModel(widget: HomeBuyerScreen()),
    BnModel(widget: FavoriteBuyerScreen()),
    BnModel(widget: HomeChatScreen()),
    BnModel(widget: SearchBuyerScreen()),
    BnModel(widget: ProfileBuyerScreen()),
  ];

  void changeTab(int index) {
    //<-PageChange logic
    switch (index) {
      case 0:
        setState(
          () {
            _currentIndex = 0;
          },
        );
        break;
      case 1:
        setState(
          () {
            _currentIndex = 1;
          },
        );
        break;
      case 2:
        setState(
          () {
            _currentIndex = 2;
          },
        );
        break;
      case 3:
        setState(
          () {
            _currentIndex = 3;
          },
        );
        break;
      case 4:
        setState(
          () {
            _currentIndex = 4;
          },
        );
        break;
      default:
        setState(
          () {
            _currentIndex = 0;
          },
        );
    }
  }

  @override
  void initState() {
    AddAddressSellerController.to.getGovernorate();
    GeneralGetxController.to.sendFcmToken(SharedPrefController().fcmToken);
    Future.delayed(Duration.zero, () {
      FbNotifications.initializeForegroundNotificationForAndroid(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _bnScreen[_currentIndex].widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int value) {
          changeTab(value);
        },
        currentIndex: _currentIndex,

        type: BottomNavigationBarType.fixed,

        showSelectedLabels: false,
        showUnselectedLabels: false,

        backgroundColor: ColorResource.white,
        elevation: 8,

        selectedItemColor: ColorResource.mainColor,
        selectedIconTheme: const IconThemeData(color: ColorResource.mainColor),

        // iconSize: 16,

        unselectedItemColor: ColorResource.gray,
        unselectedIconTheme:
            const IconThemeData(color: ColorResource.mainColor),

        items: [
          BottomNavigationBarItem(
            icon: AppSvgPicture(
              assetName: IconsApp.homeOutline,
              height: 20.h,
              width: 20.w,
            ),
            activeIcon: AppSvgPicture(
              assetName: IconsApp.homeFill,
              height: 20.h,
              width: 20.w,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: AppSvgPicture(
              assetName: IconsApp.favoriteOutline,
              height: 20.h,
              width: 20.w,
            ),
            activeIcon: AppSvgPicture(
              assetName: IconsApp.favoriteFill,
              height: 20.h,
              width: 20.w,
            ),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: AppSvgPicture(
              assetName: IconsApp.chatOutline,
              height: 20.h,
              width: 20.w,
            ),
            activeIcon: AppSvgPicture(
              assetName: IconsApp.chatFill,
              height: 20.h,
              width: 20.w,
            ),
            label: 'chat',
          ),
          BottomNavigationBarItem(
            icon: AppSvgPicture(
              assetName: IconsApp.searchOutline,
              height: 20.h,
              width: 20.w,
            ),
            activeIcon: AppSvgPicture(
              assetName: IconsApp.searchFill,
              height: 20.h,
              width: 20.w,
            ),
            label: 'search',
          ),
          BottomNavigationBarItem(
            icon: AppSvgPicture(
              assetName: IconsApp.profileOutline,
              height: 20.h,
              width: 20.w,
            ),
            activeIcon: AppSvgPicture(
              assetName: IconsApp.profileFill,
              height: 20.h,
              width: 20.w,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
