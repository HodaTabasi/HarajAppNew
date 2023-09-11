part of public_profile_seller_view;

class MainListTile extends StatelessWidget {
  final String text;
  final String image;

  final VoidCallback? onPress;

  const MainListTile(
      {required this.text, Key? key, required this.image, this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.h),
        child: Column(
          children: [
            Row(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    AppSvgPicture(
                      assetName: image,
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    AppText(
                      text: text,
                      color: ColorResource.black,
                    )
                  ],
                ),
                const Spacer(),
                const Icon(
                  Icons.arrow_forward_ios,
                  color: ColorResource.iconGrey,
                ),
              ],
            ),
            Divider(
              thickness: 0.5,
              color: ColorResource.dividerVirticalColor,
            )
          ],
        ),
      ),
    );

    // ListTile(
    //   minLeadingWidth: 0,
    //   contentPadding: EdgeInsets.zero,
    //   minVerticalPadding: 0,
    //   horizontalTitleGap: 0,
    //   title: Transform.translate(
    //     offset: Offset(70, 0),
    //     child: TextUtils(
    //       color: mainFontColor,
    //       fontSize: 16.sp,
    //       fontWeight: FontWeight.w400,
    //       text: text,
    //     ),
    //   ),
    //   leading: CustomSvgImage(
    //     imageName: image,
    //   ),
    //   trailing: const Icon(
    //     Icons.arrow_forward_ios,
    //     color: secondaryColor,
    //   ),
    // );
  }
}