part of complete_store_seller_view;

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
        radius: 50.r,
        backgroundColor: ColorResource.lightGray,
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            CircleAvatar(
              radius: 50.r,
              backgroundColor: ColorResource.lightGray,
              child: AppSvgPicture(
                assetName: IconsApp.logoSeller,
              ),
            ),
            CircleAvatar(
              radius: 18.r,
              backgroundColor: ColorResource.mainColor,
              child: Icon(
                Icons.camera_alt_rounded,
                size: 24.w,
                color: ColorResource.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
