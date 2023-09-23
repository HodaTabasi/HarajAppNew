part of ads_detail_buyer_view;

class BottomSheetBodyDetail extends StatefulWidget {
  const BottomSheetBodyDetail({super.key, required this.id});
  final int id;

  @override
  State<BottomSheetBodyDetail> createState() => _BottomSheetBodyDetailState();
}

class _BottomSheetBodyDetailState extends State<BottomSheetBodyDetail> {
  late AdsDetailController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(AdsDetailController(productId: widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
        AppText(
          fontSize: 16.sp,
          fontWeight: FontWeight.w300,
          text: context.localizations.more_details,
          color: ColorResource.mainFontColor,
        ),
        AppDivider(
          color: ColorResource.secondaryColor,
          height: 25.h,
          thickness: 1.h,
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                LineDetail(
                  detail: 'المواصفات الاقليمية :',
                  result: controller.adsDetail.standard!.name!,
                ),
                LineDetail(
                  detail: 'الضمان :',
                  result: controller.adsDetail.guarantee.toString(),
                ),
                LineDetail(
                  detail: 'نشر في  :',
                  result: controller.adsDetail.createdAt!,
                ),
                LineDetail(
                  detail: 'اللون الخارجي :',
                  result: controller.adsDetail.outColor!.name!,
                ),
                LineDetail(
                  detail: 'عدد الابواب :',
                  result: controller.adsDetail.door!.number.toString(),
                ),
                LineDetail(
                  detail: 'الحالة :',
                  result: controller.adsDetail.generalStatus!.name!,
                ),
                LineDetail(
                  detail: 'اللون الداخلي :',
                  result: controller.adsDetail.inColor!.name!,
                ),
                LineDetail(
                  detail: 'عدد المقاعد :',
                  result: controller.adsDetail.seat!.number.toString(),
                ),
                LineDetail(
                  detail: 'عدد الاسطوانات :',
                  result: controller.adsDetail.cylinder!.number.toString(),
                ),
                LineDetail(
                  detail: 'نوع الوقود :',
                  result: controller.adsDetail.fuel!.name!,
                ),
                LineDetail(
                  detail: 'ميزات تقنية :',
                  result: controller.adsDetail.mechanicalStatus!.name!,
                ),
                LineDetail(
                  detail: 'جهة القيادة :',
                  result: controller.adsDetail.drivingSide!.name!,
                ),
                LineDetail(
                  detail: 'اضافي :',
                  result: controller.adsDetail.details!,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
