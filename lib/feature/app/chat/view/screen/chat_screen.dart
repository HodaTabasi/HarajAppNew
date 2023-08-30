part of home_chat_view;

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key, required this.comeFrom});

  final String comeFrom;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<Message> _message = <Message>[
    const Message(message: "message1", isSender: true),
    const Message(message: "message2", isSender: false),
    const Message(message: "message3", isSender: true),
    const Message(message: "message4", isSender: false),
    const Message(message: "message5", isSender: true),
    const Message(message: "message4", isSender: false),
    const Message(message: "message5", isSender: true),
    const Message(message: "message4", isSender: false),
    const Message(message: "message5", isSender: true),
    const Message(message: "message4", isSender: false),
    const Message(message: "message5", isSender: true),
    const Message(message: "message6", isSender: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: ColorResource.lightgreen,
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
            ImageComponent(
              height: 32.h,
              width: 32.w,
              image: ImagesApp.brandLogo,
            ),
            SizedBox(width: 5.w),
            AppText(
              color: ColorResource.mainFontColor,
              text: "Mahmoud Maher",
              fontWeight: FontWeight.w500,
              fontSize: 15.sp,
              textAlign: TextAlign.start,
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 4.h),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const WelcomeMessage(),
                    const AppChatCarContainer(
                        imageCar: ImagesApp.imageSwiper,
                        nameCar: "توسان اكسنت 2022",
                        conditionCar: "ممتاز",
                        priceCar: "50000 درهم",
                        postingTime: "8:30 ص"),
                    ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: _message.length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return Align(
                          alignment: _message[index].isSender
                              ? AlignmentDirectional.centerEnd
                              : AlignmentDirectional.centerStart,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12.w, vertical: 8.h),
                            margin: EdgeInsetsDirectional.only(
                              bottom: 5.h,
                              start: !_message[index].isSender ? 0.w : 50.w,
                              end: _message[index].isSender ? 0.w : 50.w,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(8.r),
                                topLeft: Radius.circular(8.r),
                                bottomLeft: _message[index].isSender
                                    ? Radius.zero
                                    : Radius.circular(8.r),
                                bottomRight: !_message[index].isSender
                                    ? Radius.zero
                                    : Radius.circular(8.r),
                              ),
                              color: ColorResource.lightgreen,
                            ),
                            child: Column(
                              children: [
                                AppText(
                                  text: _message[index].message,
                                  color: ColorResource.mainFontColor,
                                  textAlign: TextAlign.start,
                                  fontSize: 14.sp,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ]),
            ),
          ),
          widget.comeFrom == context.localizations.requests
              ? Container(
                  height: 170.h,
                  width: double.infinity,
                  padding:
                      EdgeInsets.symmetric(horizontal: 14.w, vertical: 16.h),
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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                              child: DoneButton(
                                  title: context.localizations.yes,
                                  titleColor: ColorResource.white,
                                  backgroundColor: ColorResource.mainColor,
                                  borderColor: ColorResource.mainColor,
                                  onPressed: () {})),
                          SizedBox(width: 15.w),
                          Expanded(
                              child: DoneButton(
                                  title: context.localizations.no,
                                  titleColor: ColorResource.mainColor,
                                  backgroundColor: Colors.white,
                                  borderColor: ColorResource.mainColor,
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
                              start: 20.w, end: 12.w, top: 12.h, bottom: 12.h),
                          decoration: BoxDecoration(
                            color: ColorResource.white,
                            borderRadius: BorderRadius.circular(30.r),
                            border: Border.all(color: ColorResource.gray),
                            boxShadow: [
                              BoxShadow(
                                color: ColorResource.lightGrey,
                                blurRadius: 3.r,
                                offset: const Offset(0, 0),
                              ),
                            ],
                          ),
                          child: TextField(
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                            textCapitalization: TextCapitalization.sentences,
                            minLines: 1,
                            maxLines: 3,
                            textInputAction: TextInputAction.send,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 12.w, vertical: 5.h)),
                          ),
                        ),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.send_rounded,
                            color: ColorResource.gray,
                          ))
                    ],
                  ),
                ),
        ],
      ),
    );
  }
}
