part of add_ads_seller_view;

class BottomSheetBodySuccess extends StatelessWidget {
  const BottomSheetBodySuccess({super.key});

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
            radius: 50.r,
            backgroundColor: ColorResource.lightGray,
            child: AppSvgPicture(
              assetName: IconsApp.character,
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
          text: context.localizations.add_car_data_successfully,
          color: ColorResource.mainFontColor,
        ),
        AppDivider(
          color: ColorResource.secondaryColor,
          height: 41.h,
          thickness: 1.h,
        ),
        AppText(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          text: context.localizations.new_contact_info,
          color: ColorResource.mainFontColor,
        ),
        const Spacer(),
        Row(
          children: [
            Expanded(
              child: DoneButton(
                title: context.localizations.yess,
                onPressed: () {
                  Get.to(() => AddContactInformationSellerScreen());
                },
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: DoneButton(
                title: context.localizations.noo,
                onPressed: () {
                  Get.to(() => const DashboardSellerScreen());
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
