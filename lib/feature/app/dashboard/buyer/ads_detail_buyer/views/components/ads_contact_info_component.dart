part of ads_detail_buyer_view;

class AdsContactInfoComponent extends StatefulWidget {
  const AdsContactInfoComponent({super.key});

  @override
  State<AdsContactInfoComponent> createState() =>
      _AdsContactInfoComponentState();
}

class _AdsContactInfoComponentState extends State<AdsContactInfoComponent> {
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
          MoreButton(
            title: context.localizations.chat,
            onPressed: () {},
          ),
          SizedBox(height: 3.h),
          RowDividerWidget(
            text: context.localizations.or,
          ),
          SizedBox(height: 3.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SocialContainer(
                nameIcon: IconsApp.twitter,
                onPressed: () {},
              ),
              SocialContainer(
                nameIcon: IconsApp.whatsapp,
                onPressed: () {},
              ),
              SocialContainer(
                nameIcon: IconsApp.call,
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
