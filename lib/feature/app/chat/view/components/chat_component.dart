part of home_chat_view;

class ChatComponent extends StatefulWidget {
  const ChatComponent({super.key});

  @override
  State<ChatComponent> createState() => _ChatComponentState();
}

class _ChatComponentState extends State<ChatComponent> {
  List myList = ['', '', ''];

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
          // Wrap the ChatComponent in an Expanded widget
          child: Padding(
            padding: EdgeInsets.only(bottom: 90.h),
            child: AppBodyContainer(
              body: ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: 30,
                itemBuilder: (BuildContext context, int index) {
                  // Use a unique key for each item
                  final itemKey = Key('item $index');
                  return Dismissible(
                    key: itemKey,
                    background: const BackgroundDismissible(),
                    // Only allow dismiss from end
                    direction: DismissDirection.endToStart,
                    onDismissed: (DismissDirection direction) {
                      // Handle item dismissal and removal from your data source here
                      setState(() {
                        // Remove the item from your data source (e.g., a list)
                        myList.removeAt(index);
                      });
                    },
                    child: InkWell(
                      onTap: () {
                        Get.to(() =>
                            ChatScreen(comeFrom: context.localizations.chat));
                      },
                      child: const AppChatCard(
                        image: ImagesApp.brandLogo,
                        title: "Mahmoud Maher",
                        subTitle: "Hello SR",
                        time: "28/08/2023",
                        numberOfMessages: "3",
                        isOnLine: true,
                        isMessage: true,
                        isNewMessage: true,
                      ),
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
