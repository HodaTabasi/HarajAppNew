part of payment_view;

class ExpandAdsLimitsComponent extends StatefulWidget {
  const ExpandAdsLimitsComponent({super.key});

  @override
  State<ExpandAdsLimitsComponent> createState() => _ExpandAdsLimitsComponentState();
}

class _ExpandAdsLimitsComponentState extends State<ExpandAdsLimitsComponent> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics:  const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 20.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 155.w,
                height: 155.h,
                alignment: Alignment.center,
                padding: EdgeInsets.all(12.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: ColorResource.mainColor.withOpacity(0.60),
                ),
                child: AppText(
                  text: context.localizations.expand_ads_limits_price,
                  color: ColorResource.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
          Container(
            alignment: Alignment.topLeft,
            padding:EdgeInsets.all(12.h) ,
            child: AppText(
              textAlign: TextAlign.start,
              text: context.localizations.contact_sales_for_expand,
              color: ColorResource.black,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: (){
                  launchUrl(Uri.parse("tel://00971509143000"));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 15.w),
                    AppSvgPicture(
                      width: 20,
                      height: 20,
                      assetName: IconsApp.contactUs,
                    ),

                    SizedBox(width: 10.w),
                    AppText(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w800,
                      text: context.localizations.contact_number,
                      color: ColorResource.mainColor,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              InkWell(
                onTap: (){
                  launchUrl(Uri.parse("https://wa.me/+971509145000"));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 15.w),
                    AppSvgPicture(
                      width: 20,
                      height: 20,
                      assetName: IconsApp.whatsapp,
                    ),

                    SizedBox(width: 10.w),
                    AppText(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w800,
                      text: context.localizations.contact_via_whats,
                      color: ColorResource.green,
                    ),
                  ],
                ),
              )

            ],
          )
        ],
      ),
    );
  }


}
