part of gallery_buyer_view;

class MapScreen extends StatefulWidget {
  const MapScreen({super.key, required this.id});

  final int id;

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GalleryBuyerController galleryBuyerController;
  late AdsDetailBuyerController adsDetailBuyerController;

  @override
  void initState() {
    super.initState();
    galleryBuyerController =
        Get.put(GalleryBuyerController(storeId: widget.id));
    adsDetailBuyerController =
        Get.put(AdsDetailBuyerController(productId: widget.id));
    galleryBuyerController.setMarker(
        adsDetailBuyerController.adsDetail.store!.id.toString(),
        adsDetailBuyerController.adsDetail.store!.name!,
        adsDetailBuyerController.adsDetail.store!.address!.lat!,
        adsDetailBuyerController.adsDetail.store!.address!.lng!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return galleryBuyerController.loading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SafeArea(
                child: Stack(
                  children: [
                    Center(
                      child: GoogleMap(
                        mapType: MapType.normal,
                        padding: EdgeInsets.all(1.w),
                        initialCameraPosition:
                            galleryBuyerController.initialCameraPosition(
                                adsDetailBuyerController
                                    .adsDetail.store!.address!.lat!,
                                adsDetailBuyerController
                                    .adsDetail.store!.address!.lng!),
                        onMapCreated: onMapCreated,
                        markers: galleryBuyerController.markers,
                        myLocationEnabled: true,
                        myLocationButtonEnabled: false,
                        compassEnabled: false,
                        // onTap: onTapMap,
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 16.h),
                      child: CircleAvatar(
                        radius: 15.r,
                        backgroundColor: ColorResource.gray,
                        child: IconButton(
                          onPressed: () {
                            // Navigator.pop(context);
                            Get.back();
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
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.w, vertical: 10.h),
                        margin: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 24.h),
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.r),
                          color: ColorResource.secondaryColor.withOpacity(0.6),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppSvgPicture(
                                  assetName: IconsApp.locationMap,
                                  width: 17.w,
                                  height: 23.h,
                                ),
                                SizedBox(width: 5.w),
                                AppText(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w500,
                                  text: 'الموقع :',
                                  color: ColorResource.shadeGrey3,
                                ),
                                SizedBox(width: 5.w),
                                AppText(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w500,
                                  text:
                                      "${adsDetailBuyerController.adsDetail.store!.address!.governorate!.name!},${adsDetailBuyerController.adsDetail.store!.address!.city!.name!},${adsDetailBuyerController.adsDetail.store!.address!.street!}",
                                  color: ColorResource.mainFontColor,
                                  textAlign: TextAlign.start,
                                ),
                                const Spacer()
                              ],
                            ),
                            SizedBox(height: 10.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppSvgPicture(
                                  assetName: IconsApp.buildingNumber,
                                  width: 17.w,
                                  height: 20.h,
                                ),
                                SizedBox(width: 5.w),
                                AppText(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w500,
                                  text: 'رقم المبنى :',
                                  color: ColorResource.shadeGrey3,
                                ),
                                SizedBox(width: 5.w),
                                Expanded(
                                  child: AppText(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w500,
                                    text:
                                        "${adsDetailBuyerController.adsDetail.store!.address!.buildingNo!},${adsDetailBuyerController.adsDetail.store!.address!.postCode!}",
                                    color: ColorResource.mainFontColor,
                                    maxLine: 1,
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
      }),
    );
  }

  void onMapCreated(GoogleMapController controller) {
    setState(() {
      galleryBuyerController.mapController = controller;
    });
  }
}
