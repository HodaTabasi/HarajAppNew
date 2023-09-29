part of ads_detail_buyer_view;

class AdsDetailComponent extends StatefulWidget {
  const AdsDetailComponent({super.key, required this.id});
  final int id;

  @override
  State<AdsDetailComponent> createState() => _AdsDetailComponentState();
}

class _AdsDetailComponentState extends State<AdsDetailComponent> {
  late AdsDetailController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(AdsDetailController(productId: widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return AppBodyContainer(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //TODO: Make Lang Here
            LineDetail(
              detail: 'الفئة :',
              result: controller.adsDetail.category!.name!,
            ),
            LineDetail(
              detail: 'السنة الانتاج :',
              result: controller.adsDetail.year!,
            ),
            LineDetail(
              detail: 'كيلوميترات :',
              result: controller.adsDetail.distance.toString(),
            ),
            LineDetail(
              detail: 'نوع الجسم :',
              result: controller.adsDetail.body!.name!,
            ),
            LineDetail(
              detail: 'الحالة الميكانيكية :',
              result: controller.adsDetail.mechanicalStatus!.name!,
            ),
            LineDetail(
              detail: 'نوع البائع :',
              result: controller.adsDetail.sellerType!.name!,
            ),
            LineDetail(
              detail: 'نوع الناقل :',
              result: controller.adsDetail.gear!.name!,
            ),
            LineDetail(
              detail: 'قوة المحرك :',
              result: controller.adsDetail.engine!.number.toString(),
            ),
            MoreButton(
              title: context.localizations.more,
              onPressed: () {
                Get.bottomSheet(
                    AppBottomSheet(
                      body: BottomSheetBodyDetail(id: widget.id),
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
