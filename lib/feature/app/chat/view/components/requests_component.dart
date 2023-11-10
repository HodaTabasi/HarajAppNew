part of home_chat_view;

class RequestsComponent extends StatefulWidget {
  const RequestsComponent({super.key});

  @override
  State<RequestsComponent> createState() => _RequestsComponentState();
}

class _RequestsComponentState extends State<RequestsComponent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10.h),
        RowDividerWidget(
          text: '030 ${context.localizations.ad}',
          lineColor: ColorResource.gray,
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(bottom: 90.h),
            child: AppBodyContainer(
              body: ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: 30,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      // Handle item tap here
                      Get.to(() =>
                          ChatScreen(comeFrom: context.localizations.requests, chatId: 0,));
                    },
                    child: const AppChatCard(
                      image: ImagesApp.brandLogo,
                      title: "Mahmoud Maher",
                      subTitle: "Hello SR",
                      time: "28/08/2023",
                      numberOfMessages: "3",
                      isOnLine: false,
                      isMessage: false,
                      isNewMessage: false,
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
