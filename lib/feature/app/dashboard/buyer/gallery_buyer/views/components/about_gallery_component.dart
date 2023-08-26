part of gallery_buyer_view;

class AboutGalleryComponent extends StatefulWidget {
  const AboutGalleryComponent({super.key});

  @override
  State<AboutGalleryComponent> createState() => _AboutGalleryComponentState();
}

class _AboutGalleryComponentState extends State<AboutGalleryComponent> {
  @override
  Widget build(BuildContext context) {
    return AppBodyContainer(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HeaderImage(),
            SizedBox(height: 24.h),
            AppText(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              text: "معرض النور لبيع وشراء السيارات",
              color: ColorResource.mainColor,
            ),
            SizedBox(height: 8.h),
            AppText(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              text: "يعرض 100 سيارة للبيع",
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
              text:
                  """Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since""",
              color: ColorResource.mainFontColor,
            ),
            Divider(
              color: ColorResource.secondaryColor,
              height: 31.h,
              thickness: 1.h,
            ),
            InkWell(
              onTap: () {
                Get.to(() => MapScreen());
              },
              child: Row(
                children: [
                  AppSvgPicture(
                    assetName: IconsApp.locationMini,
                    width: 10.w,
                    height: 14.h,
                  ),
                  SizedBox(width: 10.w),
                  AppText(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                    text: 'الشارقة ,العين ,شارع فلسطين',
                    color: ColorResource.mainFontColor,
                  ),
                  const Spacer(),
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
