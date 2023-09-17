part of public_profile_buyer_view;

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
        title: const AppText(text: 'بياناتي'),
        actions: [
          InkWell(
            onTap: () {
              CompleteProfileBuyerController.to.fromEditPage = true;
              CompleteProfileBuyerController.to.putDataToTextField(user: ProfileBuyerController.to.userModel!.data);
                 Get.to(()=> CompleteProfileBuyerScreen());
            },
            child: AppSvgPicture(assetName: IconsApp.editProfile),
          ),
        ],
      ),
    );
  }
}
