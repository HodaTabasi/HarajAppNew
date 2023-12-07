part of home_seller_view;

class TotalViews extends StatefulWidget {
  const TotalViews({super.key});

  @override
  State<TotalViews> createState() => _TotalViewsState();
}

class _TotalViewsState extends State<TotalViews> {
  final HomeSellerController controller = Get.put(HomeSellerController());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160.w,
      height: 90.h,
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
                text: controller.searchAdsList
                    .where((p0) =>
                        p0.viewsCount != null && int.parse(p0.viewsCount!) > 0)
                    .toList()
                    .length
                    .toString(),
                color: ColorResource.mainColor,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
              SizedBox(width: 5.w),
              AppText(
                //TODO:Make Lang Here
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
