part of add_ads_seller_view;

class AddSellerFourthPage extends GetView<AddAdsSellerController> {
  final AddAdsSellerController addAdsSellerController =
      Get.put(AddAdsSellerController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          AppBodyContainer(
            verticalMargin: 0.h,
            verticalPadding: 0.h,
            horizontalPadding: 0.w,
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.only(start: 12.w, top: 12.h),
                  child: AppText(
                    text: context.localizations.add_car_images,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: ColorResource.mainFontColor,
                    textAlign: TextAlign.start,
                  ),
                ),
                AppDivider(
                  height: 24.h,
                  color: ColorResource.gray,
                  thickness: 1,
                ),
                const ShowPhoto(),
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: (){
                          controller.deleteImageFromGallery();
                        },
                        child: Container(
                          width: double.infinity.w,
                          height: 40.h,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: ColorResource.mainColor.withOpacity(0.05),
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(14.r),
                            ),
                          ),
                          child: AppSvgPicture(
                            assetName: IconsApp.remove,
                          ),
                        ),
                      ),
                    ),
                    const VerticalDivider(
                      color: ColorResource.gray,
                      width: 1,
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          // controller.selectPhoto();
                          controller.selectImages();
                        },
                        child: Container(
                          width: double.infinity.w,
                          height: 40.h,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: ColorResource.mainColor.withOpacity(0.05),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(14.r),
                            ),
                          ),
                          child: Icon(
                            Icons.add_rounded,
                            size: 35.w,
                            color: ColorResource.mainColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          AppDivider(
            height: 37.h,
            color: ColorResource.gray,
            thickness: 1,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppText(
                text: context.localizations.guarantee,
                color: ColorResource.gray,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
              const Spacer(),
              AppSwitchButton(mapKey: "guarantee",),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppText(
                text: " قابل للتصدير",
                color: ColorResource.gray,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
              const Spacer(),
              AppSwitchButton(mapKey: "exportable",),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppText(
                text: " قابل للتمويل",
                color: ColorResource.gray,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
              const Spacer(),
              AppSwitchButton(mapKey: "finance",),
            ],
          ),
          SizedBox(height: 12.h),
          DoneButton(
            //TODO: Make Lang Here
            title: 'اضافة',
            onPressed: () {
              Get.bottomSheet(
                  AppBottomSheet(
                    body: const BottomSheetBodySuccess(),
                    height: 410.h,
                  ),
                  enterBottomSheetDuration: const Duration(milliseconds: 500),
                  exitBottomSheetDuration: const Duration(milliseconds: 400));
            },
          ),
        ],
      ),
    );
  }
}
