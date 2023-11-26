part of home_chat_view;

class ChatComponent extends StatefulWidget {
  const ChatComponent({super.key});

  @override
  State<ChatComponent> createState() => _ChatComponentState();
}

class _ChatComponentState extends State<ChatComponent> {
  final HomeChatController controller = Get.put(HomeChatController());
  List myList = ['', '', ''];

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.loading.value) {
        return const Center(child: CircularProgressIndicator());
      } else if (controller.chatConversations.isNotEmpty) {
        return Column(
          children: [
            SizedBox(height: 10.h),
            RowDividerWidget(
              text: '${controller.chatConversations.length} ${'محادثة'}',
              lineColor: ColorResource.gray,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(bottom: 90.h),
                child: AppBodyContainer(
                  body: ListView.builder(
                    controller: controller.scrollController,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: controller.chatConversations.length,
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
                          // setState(() {
                          //   // Remove the item from your data source (e.g., a list)
                          //   myList.removeAt(index);
                          // });
                        },
                        child: InkWell(
                          onTap: () {
                            Get.to(() =>
                                ChatScreen(comeFrom: context.localizations.chat,
                                    chatId: controller.chatConversations[index].id!,
                                  otherUser: controller.chatConversations[index].client,
                                  post: controller.chatConversations[index].post,

                                ));
                          },
                          child:  AppChatCard(
                            image:controller.chatConversations[index].client?.avatar ?? '',
                            title: controller.chatConversations[index].client?.name ?? '',
                            subTitle: controller.chatConversations[index].lastMessageContent ?? '',
                            postId: controller.chatConversations[index].post?.id,
                            time: controller.chatConversations[index].lastMessageCreatedAt ?? '',
                            numberOfMessages: "",
                            isOnLine: false,
                            isMessage: true,
                            isNewMessage: false,
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
      } else {
        return const Center(
          child: Text('No data'),
        );
      }
    });
  }
}
