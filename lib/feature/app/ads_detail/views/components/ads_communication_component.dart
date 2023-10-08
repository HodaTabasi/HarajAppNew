part of ads_detail_buyer_view;

class AdsCommunicationComponent extends StatefulWidget {
  const AdsCommunicationComponent({super.key, required this.id});
  final int id;

  @override
  State<AdsCommunicationComponent> createState() =>
      _AdsCommunicationComponentState();
}

class _AdsCommunicationComponentState extends State<AdsCommunicationComponent> {
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
              if (controller.adsDetail.value.chat! == true) {
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
                      controller.adsDetail.value.facebook!, 'facebook');
                },
              ),
              SocialContainer(
                nameIcon: IconsApp.whatsapp,
                onPressed: () async {
                  if (controller.adsDetail.value.whatsappConnection! == true) {
                    controller.launchURL(
                        "wa.me/${controller.adsDetail.value.whatsapp!}", 'https');
                  }
                },
              ),
              SocialContainer(
                nameIcon: IconsApp.call,
                onPressed: () async {
                  if (controller.adsDetail.value.call! == true) {
                    controller.launchURL(controller.adsDetail.value.whatsapp!, 'tel');
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
