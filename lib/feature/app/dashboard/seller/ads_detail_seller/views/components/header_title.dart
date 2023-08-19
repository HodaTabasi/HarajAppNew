part of ads_detail_seller_view;

class HeaderTitle extends StatefulWidget {
  const HeaderTitle({Key? key}) : super(key: key);

  @override
  State<HeaderTitle> createState() => _HeaderTitleState();
}

class _HeaderTitleState extends State<HeaderTitle> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppText(
              color: ColorResource.mainFontColor,
              text: 'بوغاتي شيرون',
              fontWeight: FontWeight.w500,
              fontSize: 16.sp,
            ),
            AppText(
              color: ColorResource.mainColor,
              text: '500000 درهم',
              fontWeight: FontWeight.w500,
              fontSize: 16.sp,
            ),
          ],
        ),
        SizedBox(height: 16.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Icons.access_time_rounded,
              color: ColorResource.gray,
              size: 18.w,
            ),
            SizedBox(width: 5.w),
            AppText(
              color: ColorResource.gray,
              text: 'وقت النشر : ',
              fontWeight: FontWeight.w500,
              fontSize: 16.sp,
            ),
            AppText(
              color: ColorResource.gray,
              text: 'قبل ساعة',
              fontWeight: FontWeight.w500,
              fontSize: 16.sp,
            ),
          ],
        ),
      ],
    );
  }
}
