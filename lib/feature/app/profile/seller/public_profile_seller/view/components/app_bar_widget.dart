part of public_profile_seller_view;

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: AppText(text: 'بياناتي'),
        actions: [
          InkWell(
            onTap: () {},
            child: AppSvgPicture(assetName: IconsApp.editProfile),
          ),
        ],
      ),
    );
  }
}
