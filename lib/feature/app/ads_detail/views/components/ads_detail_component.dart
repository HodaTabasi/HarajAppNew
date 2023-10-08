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
              result: controller.adsDetail.value.category!.name!,
            ),
            LineDetail(
              detail: 'السنة الانتاج :',
              result: '${controller.adsDetail.value.year!}',
             // result: controller.adsDetail.value.year.toString(),
            ),
            LineDetail(
              detail: 'كيلوميترات :',
              result: controller.adsDetail.value.distance.toString(),
            ),
            LineDetail(
              detail: 'نوع الجسم :',
              result: controller.adsDetail.value.body!.name!,
            ),
            LineDetail(
              detail: 'الحالة الميكانيكية :',
              result: controller.adsDetail.value.mechanicalStatus!.name!,
            ),
            LineDetail(
              detail: 'نوع البائع :',
              result: controller.adsDetail.value.sellerType!.name!,
            ),
            LineDetail(
              detail: 'نوع الناقل :',
              result: controller.adsDetail.value.gear!.name!,
            ),
            LineDetail(
              detail: 'قوة المحرك :',
              result: controller.adsDetail.value.engine!.number.toString(),
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
