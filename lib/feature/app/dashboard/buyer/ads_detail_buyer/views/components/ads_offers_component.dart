part of ads_detail_buyer_view;

class AdsOffersComponent extends StatefulWidget {
  const AdsOffersComponent({super.key});

  @override
  State<AdsOffersComponent> createState() => _AdsOffersComponentState();
}

class _AdsOffersComponentState extends State<AdsOffersComponent> {
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
          SizedBox(height: 9.h),
          InputField(),
          MoreButton(
            title: context.localizations.offer_submit,
            onPressed: () {
              Get.dialog(AlertDialog());
            },
          ),
        ],
      ),
    );
  }
}
