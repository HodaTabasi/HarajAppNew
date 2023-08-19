part of home_seller_view;

class TotalAds extends StatefulWidget {
  const TotalAds({super.key});

  @override
  State<TotalAds> createState() => _TotalAdsState();
}

class _TotalAdsState extends State<TotalAds> {
  double progressPercentage = 75.0; // Change this to the desired percentage

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160.w,
      height: 138.h,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: 12.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: ColorResource.green.withOpacity(0.10),
      ),
      child: Column(
        children: [
          AppText(
            text: context.localizations.total_ads,
            color: ColorResource.mainFontColor,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
          SizedBox(height: 10.h),
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: 80.h,
                width: 80.w,
                child: CircularProgressIndicator(
                  value: progressPercentage / 100,
                  strokeWidth: 5.w,
                  backgroundColor: ColorResource.green.withOpacity(0.15),
                  valueColor:
                      const AlwaysStoppedAnimation<Color>(ColorResource.green),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText(
                    //TODO:make lang here
                    text: '24',
                    color: ColorResource.green,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  AppText(
                    text: '/',
                    color: ColorResource.green,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  AppText(
                    text: '50',
                    color: ColorResource.gray,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
