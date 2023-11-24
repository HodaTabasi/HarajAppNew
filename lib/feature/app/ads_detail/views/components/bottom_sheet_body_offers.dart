part of ads_detail_buyer_view;

class BottomSheetBodyOffers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
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
        SizedBox(height: 16.h),
        // AppText(
        //   fontSize: 16.sp,
        //   fontWeight: FontWeight.w300,
        //   text: context.localizations.select_data_modify,
        //   color: ColorResource.mainFontColor,
        // ),
        // AppDivider(
        //   color: ColorResource.secondaryColor,
        //   height: 25.h,
        //   thickness: 1.h,
        // ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // AppText(
            //   fontSize: 16.sp,
            //   fontWeight: FontWeight.w500,
            //   text: context.localizations.add_car_images,
            //   color: ColorResource.mainFontColor,
            // ),
            // AppDivider(
            //   color: ColorResource.secondaryColor,
            //   height: 25.h,
            //   thickness: 1.h,
            // ),
            AppText(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              text: context.localizations.contact_info,
              color: ColorResource.mainFontColor,
            ),
            AppDivider(
              color: ColorResource.secondaryColor,
              height: 25.h,
              thickness: 1.h,
            ),
            InkWell(
              onTap: () {
                // Get.to(() => AddAdsSellerScreen());
              },
              child: AppText(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                text: context.localizations.edit_car_info,
                color: ColorResource.mainFontColor,
              ),
            ),
            // AppDivider(
            //   color: ColorResource.secondaryColor,
            //   height: 25.h,
            //   thickness: 1.h,
            // ),
            const SizedBox(height: 16),
          ],
        ),
      ],
    );
  }
}
