part of public_profile_seller_view;

class HeaderUserInfo extends StatelessWidget {
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
              icon: IconsApp.profileEmail, data: 'Mona Fadl@gmail.com'),
          const VerticalDivider(
            color: ColorResource.mainColor,
          ),
          buildUserCell(icon: IconsApp.profilePhone, data: '+971 521104344')
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
