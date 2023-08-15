part of subscription_seller_view;

class MapScreen extends StatefulWidget {
  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  SubscriptionSellerController subscriptionSellerController =
      Get.put(SubscriptionSellerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: GoogleMap(
                mapType: MapType.normal,
                padding: EdgeInsets.all(1.w),
                initialCameraPosition:
                    subscriptionSellerController.initialCameraPosition(),
                onMapCreated: onMapCreated,
                markers: subscriptionSellerController.markers,
                myLocationEnabled: true,
                myLocationButtonEnabled: false,
                compassEnabled: false,
                // onTap: onTapMap,
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: CircleAvatar(
                radius: 15.r,
                backgroundColor: ColorResource.gray,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.close_rounded,
                    size: 14.w,
                    color: ColorResource.mainColor,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 85.h,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.r),
                  color: ColorResource.secondaryColor.withOpacity(0.6),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        AppSvgPicture(
                          assetName: IconsApp.locationMap,
                          width: 17.w,
                          height: 23.h,
                        ),
                        SizedBox(width: 10.w),
                        AppText(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                          text: 'الموقع :',
                          color: ColorResource.shadeGrey3,
                        ),
                        SizedBox(width: 10.w),
                        AppText(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                          text: 'الشارقة ,العين ,شارع فلسطين',
                          color: ColorResource.mainFontColor,
                        ),
                        const Spacer(),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    Row(
                      children: [
                        AppSvgPicture(
                          assetName: IconsApp.distance,
                          width: 17.w,
                          height: 17.h,
                        ),
                        SizedBox(width: 10.w),
                        AppText(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                          text: 'المسافة :',
                          color: ColorResource.shadeGrey3,
                        ),
                        SizedBox(width: 10.w),
                        AppText(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                          text: '10.4',
                          color: ColorResource.mainFontColor,
                        ),
                        SizedBox(width: 10.w),
                        AppText(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                          text: 'كم يبعد عنك',
                          color: ColorResource.shadeGrey3,
                        ),
                        const Spacer(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onMapCreated(GoogleMapController controller) {
    setState(() {
      subscriptionSellerController.mapController = controller;
    });
  }
}
