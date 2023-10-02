part of add_contact_information_seller_view;

class BottomSheetBody extends StatelessWidget {
  const BottomSheetBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.topLeft,
          child: CircleAvatar(
            radius: 15.r,
            backgroundColor: ColorResource.lightGray,
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
        Container(
          alignment: Alignment.center,
          child: CircleAvatar(
            radius: 60.r,
            backgroundColor: ColorResource.lightGray,
            child: AppSvgPicture(
              assetName: IconsApp.orangeCar,
            ),
          ),
        ),
        SizedBox(height: 18.h),
        AppText(
          fontSize: 18.sp,
          fontWeight: FontWeight.w800,
          text: context.localizations.congratulations,
          color: ColorResource.green,
        ),
        SizedBox(height: 18.h),
        AppText(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          text: context.localizations.add_ad_successfully,
          color: ColorResource.mainFontColor,
        ),
        const Spacer(),
        Row(
          children: [
            Expanded(
              child: DoneButton(
                title: context.localizations.yess,
                onPressed: () {
                  Get.to(() => AddAdsSellerScreen());
                },
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: DoneButton(
                //TODO:Make Lang Here
                title: "لاحقا",
                onPressed: () {
                  Get.to(()=>DashboardSellerScreen());
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
