part of add_ads_seller_view;

class ImageProfile extends StatefulWidget {
  const ImageProfile({Key? key}) : super(key: key);

  @override
  State<ImageProfile> createState() => _ImageProfileState();
}

class _ImageProfileState extends State<ImageProfile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      child: CircleAvatar(
        radius: 35.r,
        backgroundColor: ColorResource.lightGray,
        child: AppSvgPicture(
          assetName: IconsApp.car,
          height: 30.h,
          width: 50.w,
        ),
      ),
    );
  }
}
