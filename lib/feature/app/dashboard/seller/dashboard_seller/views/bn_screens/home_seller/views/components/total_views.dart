part of home_seller_view;

class TotalViews extends StatefulWidget {
  const TotalViews({super.key});

  @override
  State<TotalViews> createState() => _TotalViewsState();
}

class _TotalViewsState extends State<TotalViews> {
  double progressPercentage = 75.0; // Change this to the desired percentage

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160.w,
      height: 73.h,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: 12.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: ColorResource.mainColor.withOpacity(0.10),
      ),
      child: Column(
        children: [
          AppText(
            text: context.localizations.total_views,
            color: ColorResource.mainFontColor,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
          SizedBox(height: 2.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppText(
                //TODO:make lang here
                text: '500K',
                color: ColorResource.mainColor,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
              SizedBox(width: 5.w),
              AppText(
                text: 'مشاهدة',
                color: ColorResource.gray,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
