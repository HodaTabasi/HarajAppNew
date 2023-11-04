part of ads_detail_buyer_view;

class AdsContactInfoComponent extends StatefulWidget {
  const AdsContactInfoComponent({super.key, required this.id});

  final int id;

  @override
  State<AdsContactInfoComponent> createState() =>
      _AdsContactInfoComponentState();
}

class _AdsContactInfoComponentState extends State<AdsContactInfoComponent> {
  late AdsDetailController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(AdsDetailController(productId: widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return AppBodyContainer(
      body: Column(
        children: [
          //TODO: Make Lang Here
          if(controller.adsDetail.value.whatsapp != null)
          LineDetail(
            detail: 'رقم التواصل :',
            result: controller.adsDetail.value.whatsapp!,
          ),
          if(controller.adsDetail.value.whatsapp != null)
            LineDetail(
            detail: 'رقم الواتساب :',
            result: controller.adsDetail.value.whatsapp!,
          ),
          if(controller.adsDetail.value.facebook != null)
            LineDetail(
            detail: 'حساب الفيسبوك :',
            result: controller.adsDetail.value.facebook!,
          ),
          if(controller.adsDetail.value.chat != null)
            LineDetail(
            detail: 'الدردشة الداخلية :',
            result: controller.adsDetail.value.chat! == true ? 'متاحه' : 'غير متاحه',
          ),
        ],
      ),
    );
  }
}
