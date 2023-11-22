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
                if(controller.adsDetail.value.standard != null)
                LineDetail(
                  detail: 'المواصفات الاقليمية :',
                  result: controller.adsDetail.value.standard!.name!,
                ),
                if(controller.adsDetail.value.guarantee != null)
                LineDetail(
                  detail: 'الضمان :',
                  result: controller.adsDetail.value.guarantee.toString(),
                ),
                if(controller.adsDetail.value.createdAt != null)
                LineDetail(
                  detail: 'نشر في  :',
                  result: controller.adsDetail.value.createdAt!,
                ),
                if(controller.adsDetail.value.outColor!.name != null)
                LineDetail(
                  detail: 'اللون الخارجي :',
                  result: controller.adsDetail.value.outColor!.name!,
                ),
                if(controller.adsDetail.value.door!.number != null)
                LineDetail(
                  detail: 'عدد الابواب :',
                  result: controller.adsDetail.value.door!.number.toString(),
                ),
                if(controller.adsDetail.value.generalStatus!.name != null)
                LineDetail(
                  detail: 'الحالة :',
                  result: controller.adsDetail.value.generalStatus!.name!,
                ),
                if(controller.adsDetail.value.inColor!.name != null)
                LineDetail(
                  detail: 'اللون الداخلي :',
                  result: controller.adsDetail.value.inColor!.name!,
                ),
                if(controller.adsDetail.value.seat!.number != null)
                LineDetail(
                  detail: 'عدد المقاعد :',
                  result: controller.adsDetail.value.seat!.number.toString(),
                ),
                if(controller.adsDetail.value.cylinder!.number != null)
                LineDetail(
                  detail: 'عدد الاسطوانات :',
                  result: controller.adsDetail.value.cylinder!.number.toString(),
                ),
                if(controller.adsDetail.value.fuel!.name != null)
                LineDetail(
                  detail: 'نوع الوقود :',
                  result: controller.adsDetail.value.fuel!.name!,
                ),
                if(controller.adsDetail.value.mechanicalStatus!.name != null)
                LineDetail(
                  detail: 'ميزات تقنية :',
                  result: controller.adsDetail.value.mechanicalStatus!.name!,
                ),
                if(controller.adsDetail.value.drivingSide!.name != null)
                LineDetail(
                  detail: 'جهة القيادة :',
                  result: controller.adsDetail.value.drivingSide!.name!,
                ),
                if(controller.adsDetail.value.details != null)
                LineDetail(
                  detail: 'اضافي :',
                  result: controller.adsDetail.value.details!,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
