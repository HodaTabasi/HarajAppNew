part of gallery_buyer_view;

class AboutGalleryComponent extends StatefulWidget {
  const AboutGalleryComponent({super.key, required this.id});

  final int id;

  @override
  State<AboutGalleryComponent> createState() => _AboutGalleryComponentState();
}

class _AboutGalleryComponentState extends State<AboutGalleryComponent> {
  late GalleryBuyerController galleryBuyerController;
  late AdsDetailBuyerController adsDetailBuyerController;

  @override
  void initState() {
    super.initState();
    galleryBuyerController =
        Get.put(GalleryBuyerController(storeId: widget.id));
    adsDetailBuyerController =
        Get.put(AdsDetailBuyerController(productId: widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return AppBodyContainer(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderImage(url: adsDetailBuyerController.adsDetail.store!.avatar!),
            SizedBox(height: 24.h),
            AppText(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              text: adsDetailBuyerController.adsDetail.store!.name!,
              color: ColorResource.mainColor,
            ),
            SizedBox(height: 8.h),
            AppText(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              text: adsDetailBuyerController.adsDetail.store!.email!,
              color: ColorResource.gray,
            ),
            Divider(
              color: ColorResource.secondaryColor,
              height: 31.h,
              thickness: 1.h,
            ),
            AppText(
              fontSize: 15.sp,
              fontWeight: FontWeight.w500,
              text: context.localizations.about,
              color: ColorResource.mainFontColor,
            ),
            SizedBox(height: 12.h),
            AppText(
              fontSize: 15.sp,
              fontWeight: FontWeight.w500,
              text: adsDetailBuyerController.adsDetail.store!.description!,
              color: ColorResource.mainFontColor,
            ),
            Divider(
              color: ColorResource.secondaryColor,
              height: 31.h,
              thickness: 1.h,
            ),
            InkWell(
              onTap: () {
                Get.to(() => MapScreen(id: widget.id));
              },
              child: Row(
                children: [
                  AppSvgPicture(
                    assetName: IconsApp.locationMini,
                    width: 10.w,
                    height: 14.h,
                  ),
                  SizedBox(width: 10.w),
                  Flexible(
                    child: AppText(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                      text:
                          "${adsDetailBuyerController.adsDetail.store!.address!.governorate!.name!},${adsDetailBuyerController.adsDetail.store!.address!.city!.name!},${adsDetailBuyerController.adsDetail.store!.address!.street!}",
                      color: ColorResource.mainFontColor,
                      overflow: TextOverflow.ellipsis,
                      maxLine: 2,
                    ),
                  ),
                  // const Spacer(),
                  SizedBox(width: 10.w),
                  AppImage(
                    width: 80.h,
                    height: 80.w,
                    imageName: ImagesApp.baseMap,
                  ),
                ],
              ),
            ),
            Divider(
              color: ColorResource.secondaryColor,
              height: 20.h,
              thickness: 1.h,
            ),
          ],
        ),
      ),
    );
  }
}
