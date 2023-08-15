part of subscription_seller_view;

class MainContainer extends StatelessWidget {
  const MainContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        color: Colors.white,
        border: Border.all(color: ColorResource.shadeGrey, width: 1.w),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const HeaderImage(),
          SizedBox(height: 24.h),
          AppText(
            fontSize: 15.sp,
            fontWeight: FontWeight.w500,
            text: context.localizations.payment_bank_account,
            color: ColorResource.mainFontColor,
          ),
          SizedBox(height: 16.h),
          SwiperComponent(),
          SizedBox(height: 16.h),
          RowDividerWidget(text: context.localizations.or),
          SizedBox(height: 16.h),
          AppText(
            fontSize: 15.sp,
            fontWeight: FontWeight.w500,
            text: context.localizations.payment_cash,
            color: ColorResource.mainFontColor,
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
          AppText(
            fontSize: 15.sp,
            fontWeight: FontWeight.w500,
            text: context.localizations.activate_account,
            color: ColorResource.mainFontColor,
          ),
          SizedBox(height: 16.h),
          SaveButton(
              title: context.localizations.communication_account,
              onPressed: () {}),
          SizedBox(height: 16.h),
          InkWell(
            onTap: () {
              Get.dialog(ErrorDialog());
            },
            child: AppText(
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
              text: context.localizations.skip,
              color: ColorResource.mainColor,
            ),
          ),
        ],
      ),
    );
  }
}
