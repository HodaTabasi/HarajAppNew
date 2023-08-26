part of ads_detail_buyer_view;

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
            Expanded(
              child: OfferCard(
                name: 'معرض النور لبيع وشراء السيارات',
                subName: 'يعرض 100 سيارة للبيع الان',
                image: ImagesApp.brandLogo,
                posting: 'قبل 1 ساعة',
                onTab: () {},
              ),
            ),
          ],
        ),
      ],
    );
  }
}
