part of home_chat_view;

class BackgroundDismissible extends StatefulWidget {
  const BackgroundDismissible({super.key});

  @override
  State<BackgroundDismissible> createState() => _BackgroundDismissibleState();
}

class _BackgroundDismissibleState extends State<BackgroundDismissible> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsetsDirectional.only(end: 12.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: ColorResource.mainColor.withOpacity(0.15),
      ),
      child: AppSvgPicture(
        assetName: IconsApp.remove,
        width: 17.w,
        height: 22.h,
        color: ColorResource.mainColor,
      ),
    );
  }
}
