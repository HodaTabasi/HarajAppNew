part of ads_detail_buyer_view;

class AdsInstructionsComponent extends StatefulWidget {
  const AdsInstructionsComponent({super.key});

  @override
  State<AdsInstructionsComponent> createState() =>
      _AdsInstructionsComponentState();
}

class _AdsInstructionsComponentState extends State<AdsInstructionsComponent> {
  @override
  Widget build(BuildContext context) {
    return AppBodyContainer(
      body: Column(
        children: [
          AppText(
            text: context.localizations.communicate,
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            color: ColorResource.mainFontColor,
            textAlign: TextAlign.start,
          ),
          SizedBox(height: 18.h),
        ],
      ),
    );
  }
}
