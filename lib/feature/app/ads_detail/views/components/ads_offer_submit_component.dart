part of ads_detail_buyer_view;

class AdsOfferSubmitComponent extends StatefulWidget {
  const AdsOfferSubmitComponent({super.key, required this.id});
  final int id;

  @override
  State<AdsOfferSubmitComponent> createState() =>
      _AdsOfferSubmitComponentState();
}

class _AdsOfferSubmitComponentState extends State<AdsOfferSubmitComponent> {
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            text: context.localizations.offer,
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            color: ColorResource.mainFontColor,
            textAlign: TextAlign.start,
          ),
          SizedBox(height: 7.3.h),
          InputField(),
          MoreButton(
            title: context.localizations.offer_submit,
            onPressed: () {
              controller.performNewPrice();
            },
          ),
        ],
      ),
    );
  }
}
