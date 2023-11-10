part of home_chat_view;

class ChatScreen extends StatefulWidget {
  const ChatScreen(
      {super.key,
      required this.comeFrom,
      required this.chatId,
      this.otherUser,
      this.post});

  final String comeFrom;
  final num chatId;
  final ClientModel? otherUser;
  final PostModel? post;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late ChatDetailsController controller; // Remove the initialization here

  @override
  void initState() {
    super.initState();
    controller = Get.put(ChatDetailsController(chatId: widget.chatId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorResource.lightgreen,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios_rounded),
        ),
        centerTitle: false,
        titleSpacing: 0,
        title: Row(
          children: [
            if (widget.otherUser != null)
              ImageComponent(
                height: 32.r,
                width: 32.r,
                image: widget.otherUser!.avatar ?? '',
              ),
            SizedBox(width: 5.w),
            AppText(
              color: ColorResource.mainFontColor,
              text: widget.otherUser?.name ?? '',
              fontWeight: FontWeight.w500,
              fontSize: 15.sp,
              textAlign: TextAlign.start,
            ),
          ],
        ),
      ),
      body: Obx(
        () => controller.loading.value && controller.chatMessages.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : controller.chatMessages.isNotEmpty
                ? Column(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          reverse: true,
                          controller: controller.scrollController,
                          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                          physics: const BouncingScrollPhysics(),
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.w, vertical: 4.h),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (widget.post != null)
                                  WelcomeMessage(
                                    postId: widget.post!.id,
                                    createdDate: widget.post!.createdAt ?? '',
                                  ),
                                if (widget.post != null)
                                  AppChatCarContainer(
                                      imageCar: widget.post!.gallery == null ||
                                              widget.post!.gallery!.isEmpty
                                          ? ''
                                          : widget.post!.gallery!.first.image ??
                                              '',
                                      nameCar:
                                          "${widget.post!.brand?.name ?? ''} ${widget.post!.car?.name ?? ''} ${widget.post!.year ?? ''}",
                                      conditionCar:
                                          widget.post!.generalStatus?.name ??
                                              '',
                                      priceCar:
                                          '${widget.post!.price ?? ''} ${'درهم'}',
                                      postingTime: ""),
                                if (controller.loading.value &&
                                    controller.chatMessages.isNotEmpty)
                                  const Center(
                                      child: CircularProgressIndicator()),
                                ListView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  reverse: true,
                                  itemCount: controller.chatMessages.length,
                                  shrinkWrap: true,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Padding(
                                      padding: EdgeInsetsDirectional.only(
                                        bottom: 5.h,
                                        start: controller
                                            .chatMessages[index].isMine!
                                            ? 0.w
                                            : 50.w,
                                        end: !controller
                                            .chatMessages[index].isMine!
                                            ? 0.w
                                            : 50.w,
                                      ),                                      child: Row(
                                        mainAxisAlignment: controller
                                            .chatMessages[index].isMine
                                            ? MainAxisAlignment.start
                                            : MainAxisAlignment.end,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 12.w, vertical: 8.h),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(8.r),
                                                topLeft: Radius.circular(8.r),
                                                bottomLeft: !controller
                                                        .chatMessages[index].isMine!
                                                    ? Radius.zero
                                                    : Radius.circular(8.r),
                                                bottomRight: controller
                                                        .chatMessages[index].isMine!
                                                    ? Radius.zero
                                                    : Radius.circular(8.r),
                                              ),
                                              color: ColorResource.lightgreen,
                                            ),
                                            child: Column(
                                              children: [
                                                AppText(
                                                  text: controller
                                                          .chatMessages[index]
                                                          .content ??
                                                      '',
                                                  color:
                                                      ColorResource.mainFontColor,
                                                  textAlign: TextAlign.start,
                                                  fontSize: 14.sp,
                                                ),
                                              ],
                                            ),
                                          ),
                                          if(controller.chatMessages[index].sending)
                                          const SizedBox(width: 10),
                                          if(controller.chatMessages[index].sending)
                                            const CupertinoActivityIndicator()
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ]),
                        ),
                      ),
                      widget.comeFrom == context.localizations.start_chat(widget.post?.createdAt ?? '',widget.post?.id ?? 0)
                          ? Container(
                              height: 170.h,
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 14.w, vertical: 16.h),
                              color: ColorResource.white,
                              child: Column(
                                children: [
                                  AppText(
                                    text: context.localizations.chat_message,
                                    color: ColorResource.gray,
                                    textAlign: TextAlign.center,
                                    fontSize: 14.sp,
                                  ),
                                  SizedBox(height: 24.h),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                          child: DoneButton(
                                              title: context.localizations.yes,
                                              titleColor: ColorResource.white,
                                              backgroundColor:
                                                  ColorResource.mainColor,
                                              borderColor:
                                                  ColorResource.mainColor,
                                              onPressed: () {})),
                                      SizedBox(width: 15.w),
                                      Expanded(
                                          child: DoneButton(
                                              title: context.localizations.no,
                                              titleColor:
                                                  ColorResource.mainColor,
                                              backgroundColor: Colors.white,
                                              borderColor:
                                                  ColorResource.mainColor,
                                              onPressed: () {})),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          : Container(
                              height: 74.h,
                              width: double.infinity,
                              color: ColorResource.white,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: 50.h,
                                      width: double.infinity,
                                      margin: EdgeInsetsDirectional.only(
                                          start: 20.w,
                                          end: 12.w,
                                          top: 12.h,
                                          bottom: 12.h),
                                      decoration: BoxDecoration(
                                        color: ColorResource.white,
                                        borderRadius:
                                            BorderRadius.circular(30.r),
                                        border: Border.all(
                                            color: ColorResource.gray),
                                        boxShadow: [
                                          BoxShadow(
                                            color: ColorResource.lightGrey,
                                            blurRadius: 3.r,
                                            offset: const Offset(0, 0),
                                          ),
                                        ],
                                      ),
                                      child: TextField(
                                        onSubmitted: (val)=> controller.sendMessage(),
                                        controller: controller.chatFieldController,
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        textCapitalization:
                                            TextCapitalization.sentences,
                                        minLines: 1,
                                        maxLines: 3,
                                        textInputAction: TextInputAction.send,
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: 'اكتب الرسالة',
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 12.w,
                                                    vertical: 5.h)),
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: controller.sendMessage,
                                      icon: const Icon(
                                        Icons.send_rounded,
                                        color: ColorResource.gray,
                                      ))
                                ],
                              ),
                            ),
                    ],
                  )
                : const Center(
                    child: Text('No Messages'),
                  ),
      ),
    );
  }
}
