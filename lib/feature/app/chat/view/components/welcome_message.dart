part of home_chat_view;

class WelcomeMessage extends StatelessWidget {
  final num? postId;
  final String createdDate;
  const WelcomeMessage({super.key, required this.postId, required this.createdDate});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppText(
              color: ColorResource.green,
              //TODO:Make Lang here
              text: "مرحباََ",
              fontWeight: FontWeight.w500,
              fontSize: 20.sp,
              textAlign: TextAlign.center,
            ),
            SizedBox(width: 5.w),
            AppSvgPicture(
              assetName: IconsApp.hi,
              width: 24.w,
              height: 24.h,
            ),
          ],
        ),
        SizedBox(height: 12.h),
        AppText(
          color: ColorResource.gray,
          // text: context.localizations.start_chat,
          text: 'مرحبا بك، هنا بداية المحادثة الخاصة بالاعلان رقم $postId، والذي نشر $createdDate',
          fontWeight: FontWeight.w500,
          fontSize: 14.sp,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
