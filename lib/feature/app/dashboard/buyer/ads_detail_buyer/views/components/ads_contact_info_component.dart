part of ads_detail_buyer_view;

class AdsContactInfoComponent extends StatefulWidget {
  const AdsContactInfoComponent({super.key, required this.id});
  final int id;

  @override
  State<AdsContactInfoComponent> createState() =>
      _AdsContactInfoComponentState();
}

class _AdsContactInfoComponentState extends State<AdsContactInfoComponent> {
  late AdsDetailBuyerController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(AdsDetailBuyerController(productId: widget.id));
  }

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
          SizedBox(height: 16.h),
          MoreButton(
            title: context.localizations.chat,
            onPressed: () async {
              if (controller.adsDetail.chat! == true) {
                //here to open chat in next time
              }
            },
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
                nameIcon: IconsApp.facebook,
                onPressed: () async {
                  controller.launchURL(
                      controller.adsDetail.facebook!, 'facebook');
                },
              ),
              SocialContainer(
                nameIcon: IconsApp.whatsapp,
                onPressed: () async {
                  if (controller.adsDetail.whatsappConnection! == true) {
                    controller.launchURL(
                        "wa.me/${controller.adsDetail.whatsapp!}", 'https');
                  }
                },
              ),
              SocialContainer(
                nameIcon: IconsApp.call,
                onPressed: () async {
                  if (controller.adsDetail.call! == true) {
                    controller.launchURL(controller.adsDetail.whatsapp!, 'tel');
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
