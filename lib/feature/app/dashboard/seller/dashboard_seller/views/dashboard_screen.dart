import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:haraj/feature/app/chat/view/screen/home_chat_screen.dart';
import 'package:haraj/feature/app/dashboard/seller/dashboard_seller/views/bn_screens/add_ads_seller/views/screens/add_seller_screen.dart';
import 'package:haraj/feature/app/dashboard/seller/dashboard_seller/views/bn_screens/home_seller/views/screens/home_seller_screen.dart';
import 'package:haraj/feature/app/dashboard/seller/dashboard_seller/views/bn_screens/offer_seller/views/screens/offer_seller_screen.dart';
import 'package:haraj/feature/app/dashboard/seller/dashboard_seller/views/bn_screens/profile_seller/views/screens/profile_seller_screen.dart';
import 'package:haraj/utils/extensions/color_resource/color_resource.dart';
import 'package:haraj/utils/extensions/icons_app/icons_app.dart';
import 'package:haraj/utils/models/bn_model/bn_model.dart';
import 'package:haraj/widgets/app_svg_picture.dart';

class DashboardSellerScreen extends StatefulWidget {
  const DashboardSellerScreen({Key? key}) : super(key: key);

  @override
  _DashboardSellerScreenState createState() => _DashboardSellerScreenState();
}

class _DashboardSellerScreenState extends State<DashboardSellerScreen> {
  int _currentIndex = 0;

  final List<BnModel> _bnScreen = <BnModel>[
    BnModel(widget: HomeSellerScreen()),
    BnModel(widget: HomeChatScreen()),
    BnModel(widget: AddAdsSellerScreen()),
    BnModel(widget: OfferSellerScreen()),
    BnModel(widget: ProfileSellerScreen()),
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
              assetName: IconsApp.chatOutline,
              height: 20.h,
              width: 20.w,
            ),
            activeIcon: AppSvgPicture(
              assetName: IconsApp.chatFill,
              height: 20.h,
              width: 20.w,
            ),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: 75,
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24.r),
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [ColorResource.blueLight1, ColorResource.blueLight2],
                ),
              ),
              child: Icon(Icons.add_rounded, size: 24.w),
            ),
            activeIcon: Container(
              width: 75,
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24.r),
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [ColorResource.blueLight1, ColorResource.blueLight2],
                ),
              ),
              child: Icon(Icons.add_rounded, size: 24.w),
            ),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: AppSvgPicture(
              assetName: IconsApp.offersSubmittedOutline,
              height: 20.h,
              width: 20.w,
            ),
            activeIcon: AppSvgPicture(
              assetName: IconsApp.offersSubmittedFill,
              height: 20.h,
              width: 20.w,
            ),
            label: 'Offers',
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
