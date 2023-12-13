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
          if (controller.adsDetail.value.chat! == true)
          AppText(
            text: context.localizations.communicate,
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            color: ColorResource.mainFontColor,
            textAlign: TextAlign.start,
          ),
          if (controller.adsDetail.value.chat! == true)
          SizedBox(height: 16.h),
          if (controller.adsDetail.value.chat! == true)
          MoreButton(
            title: context.localizations.chat,
            onPressed: () async {
              // if (controller.adsDetail.value.chat! == true) {
              //   //here to open chat
              //   ChatScreen(comeFrom: context.localizations.communicate,
              //     otherUser: ClientModel(
              //       id: controller.adsDetail.value.sellerId,
              //     ),
              //     post: controller.chatConversations[index].post,
              //
              //   ));
              // }
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
                nameIcon: IconsApp.whatsapp,
                onPressed: () async{
                  if (controller.adsDetail.value.whatsappConnection! == true) {
                    launchUrl(Uri.parse("https://wa.me/${controller.adsDetail.value.whatsapp}"));
                  }else{
                    Fluttertoast.showToast(
                        msg: context.localizations.not_available,
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        textColor: Colors.white,
                        fontSize: 16.0
                    );

                  }
                },
              ),
              SocialContainer(
                nameIcon: IconsApp.call,
                onPressed: () async {
                  if (controller.adsDetail.value.call! == true) {
                    launchUrl(Uri.parse("tel://${controller.adsDetail.value.whatsapp}"));
                  }else{
                    Fluttertoast.showToast(
                        msg: context.localizations.not_available,
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        textColor: Colors.white,
                        fontSize: 16.0
                    );

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
