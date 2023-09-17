part of public_profile_buyer_view;

class HeaderUserInfo extends GetView<ProfileBuyerController> {
  const HeaderUserInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          buildUserCell(
              icon: IconsApp.profileEmail,
              data: '${controller.userModel?.data!.email}'),
          const VerticalDivider(
            color: ColorResource.mainColor,
          ),
          buildUserCell(
              icon: IconsApp.profilePhone, data: '${controller.userModel?.data!.mobile}')
        ],
      ),
    );
  }

  Column buildUserCell({required String icon, required String data}) {
    return Column(
      children: [
        AppSvgPicture(assetName: icon),
        SizedBox(
          height: 12.h,
        ),
        AppText(text: data)
      ],
    );
  }
}
