part of ads_detail_buyer_view;

class AdsDetailComponent extends StatefulWidget {
  const AdsDetailComponent({super.key});

  @override
  State<AdsDetailComponent> createState() => _AdsDetailComponentState();
}

class _AdsDetailComponentState extends State<AdsDetailComponent> {
  @override
  Widget build(BuildContext context) {
    return AppBodyContainer(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //TODO: Make Lang Here
            const LineDetail(
              detail: 'الفئة : ',
              result: 'SVT Raptor',
            ),
            const LineDetail(
              detail: 'السنة الانتاج : ',
              result: '2014',
            ),
            const LineDetail(
              detail: 'كيلوميترات : ',
              result: '145000',
            ),
            const LineDetail(
              detail: 'نوع الجسم : ',
              result: 'شاحنة النقل',
            ),
            const LineDetail(
              detail: 'الحالة الميكانيكية : ',
              result: 'ممتازة',
            ),
            const LineDetail(
              detail: 'نوع البائع : ',
              result: 'مالك السيارة',
            ),
            const LineDetail(
              detail: 'نوع الناقل : ',
              result: 'ناقل اوتوماتيكي',
            ),
            const LineDetail(
              detail: 'قوة المحرك : ',
              result: '400 - 500 حصان',
            ),
            MoreButton(
              title: context.localizations.more,
              onPressed: () {
                Get.bottomSheet(
                    AppBottomSheet(
                      body: BottomSheetBodyDetail(),
                      height: 800.h,
                    ),
                    enterBottomSheetDuration: const Duration(milliseconds: 500),
                    exitBottomSheetDuration: const Duration(milliseconds: 400));
              },
            ),
          ],
        ),
      ),
    );
  }
}
